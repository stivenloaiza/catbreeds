import 'package:flag/flag.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds/providers/home_provider.dart';
import 'package:catbreeds/views/widgets/error_widget.dart';
import 'package:catbreeds/views/widgets/loading_widget.dart';
import 'package:catbreeds/views/widgets/search_widget.dart';
import 'package:catbreeds/config.dart' as cg;
import 'detail_breed_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeProvider = context.read<HomeProvider>();
      homeProvider.loadBreeds();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cg.cBackgroundCard,
        elevation: 10,
        shadowColor: Colors.black,
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(cg.pathCatIcon, height: 30, width: 30,),
            const Text('CatBreeds', style: TextStyle(color: cg.cTextBackgroundCard),),
          ],
        ),
        actions: [
          IconButton(onPressed: homeProvider.tapSearch, icon: const Icon(Icons.search))
        ],
      ),
      body: homeProvider.isLoadingView
          ? const LoadingCatWidget()
          : homeProvider.errorIssue
          ? ErrorCustomWidget(msg: homeProvider.errorMsg)
          : SafeArea(
        child: Container(color: cg.cBackgrounds,
          child: Column(
            children: [
              if(homeProvider.searchVisible) const CustomSearch(),
              homeProvider.resultBreedList.isEmpty
                  ?const Center(child: Text('There are no matches', style: TextStyle(color: cg.cTextBackgrounds),))
                  :Expanded(
                child: ListView.builder(
                  itemCount: homeProvider.resultBreedList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: cg.cBackgroundCard,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(homeProvider.resultBreedList[index].name, style: const TextStyle(color: cg.cTextBackgroundCard, fontWeight: FontWeight.bold, fontSize: 16)),
                            subtitle: Text(homeProvider.resultBreedList[index].altNames, style: const TextStyle(color: cg.cTextBackgrounds, fontSize: 12)),
                            trailing: IconButton(onPressed: () async {
                              String urlImage = '';
                              try {
                                urlImage = await homeProvider.getUrlImage(homeProvider.resultBreedList[index].referenceImageId);
                              }catch (e){
                                if (kDebugMode) {
                                  print(e);
                                }
                              }
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBreedView(
                                      selectedBreed: homeProvider.resultBreedList[index],
                                      urlImage: urlImage))
                              );
                            }, icon: const Icon(Icons.remove_red_eye_rounded), color: cg.cBackgrounds,),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *0.3,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: FutureBuilder(
                                future: homeProvider.getUrlImage(homeProvider.resultBreedList[index].referenceImageId),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    String imageUrl = snapshot.data as String;
                                    return CachedNetworkImage(
                                      imageUrl: imageUrl,
                                      placeholder: (context, url) => const SizedBox(
                                        height: 100, width: 100, child: LoadingCatWidget(),
                                      ),
                                      errorWidget: (context, url, error) => Image.asset(cg.pathBadImage, height: 50, width: 50,),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Image.asset(cg.pathBadImage, height: 50, width: 50,);
                                  } else {
                                    return const SizedBox(
                                      height: 100, width: 100, child: LoadingCatWidget(),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Flag.fromString(homeProvider.resultBreedList[index].countryCode, height: 15, width: 15),
                                    const SizedBox(width: 5,),
                                    Text(homeProvider.resultBreedList[index].origin, style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 13)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.lightbulb, size: 15, color: Colors.yellow,),
                                    const SizedBox(width: 5,),
                                    Text('Intelligence level: ${homeProvider.resultBreedList[index].intelligence}', style: const TextStyle(color: cg.cTextBackgroundCard,  fontSize: 13)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
