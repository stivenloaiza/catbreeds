import 'dart:async';
import 'package:catbreeds/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds/config.dart' as cg;
import 'package:provider/provider.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({super.key});

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {

  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    return Container(
      color: cg.cBackgroundCard,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          autofocus: true,
          controller: homeProvider.searchController,
          onChanged: (String value) {
            if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
            _debounceTimer = Timer(const Duration(milliseconds: 500), () {
              homeProvider.searchBreed(toSearch: value);
            });
          },
          decoration: const InputDecoration(
            hintText: 'Search breeds...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
