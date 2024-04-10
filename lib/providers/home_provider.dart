import 'dart:async';
import 'dart:convert';
import 'package:catbreeds/models/breed_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:catbreeds/config.dart' as cg;

class HomeProvider extends ChangeNotifier {
  bool isLoadingView = true;
  bool errorIssue = false;
  bool searchVisible = false;
  String errorMsg = '';
  String urlSelected = '';
  List<Breed> breedList = [];
  List<Breed> resultBreedList = [];
  TextEditingController searchController = TextEditingController();

  Future<void> loadBreeds() async {
    final headers = {
      'x-api-key': cg.xApiKey,
      'content-type': 'application/json',
    };
    try {
      final response = await http.get(Uri.parse('${cg.urlBaseCats}v1/breeds'), headers: headers).timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        final body = response.body;
        List<dynamic> jsonList = json.decode(body);
        breedList = jsonList.map((json) => Breed.fromJson(json)).toList();
        resultBreedList = List.from(breedList);
        isLoadingView = false;
        errorIssue = false;
        errorMsg = '';
        notifyListeners();
      } else {
        isLoadingView = false;
        errorIssue = true;
        errorMsg = 'We could not find the breeds at this time.';
        notifyListeners();
      }
    } on TimeoutException catch (_) {
      isLoadingView = false;
      errorIssue = true;
      errorMsg = 'We could not find the breeds at this time. Check your internet connection.';
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      isLoadingView = false;
      errorIssue = true;
      errorMsg = 'We could not find the breeds at this time. Our system is failing :(';
      notifyListeners();
    }
  }

  void tapSearch(){
    searchVisible = !searchVisible;
    if(searchVisible == false){
      searchBreed(toSearch: '');
      searchController.text = '';
    }else{
      notifyListeners();
    }
  }

  void searchBreed({String toSearch = ''}){
    if(toSearch==''){
      resultBreedList = List.from(breedList);
    }else{
      resultBreedList = breedList.where((breed) => breed.name.toLowerCase().contains(toSearch.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<String> getUrlImage(String idImage) async {
    final headers = {
      'x-api-key': cg.xApiKey,
      'content-type': 'application/json',
    };
    try {
      final response = await http.get(Uri.parse('${cg.urlBaseCats}v1/images/$idImage'), headers: headers).timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        final bodyJson = jsonDecode(response.body) as Map<String, dynamic>;
        return  bodyJson['url'];
      } else {
        throw Exception('Bad Id Image');
      }
    } on TimeoutException catch (_) {
      throw Exception('Bad connection');
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw Exception('Error: $error');
    }
  }

}