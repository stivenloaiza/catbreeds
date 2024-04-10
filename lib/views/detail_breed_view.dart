import 'package:catbreeds/models/breed_model.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds/views/widgets/loading_widget.dart';
import 'package:catbreeds/config.dart' as cg;

class DetailBreedView extends StatelessWidget {
  final Breed selectedBreed;
  final String urlImage;
  const DetailBreedView({super.key, required this.selectedBreed, required this.urlImage});

  @override
  Widget build(BuildContext context) {
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
            Text(selectedBreed.name, style: const TextStyle(color: cg.cTextBackgroundCard),),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(color: cg.cBackgrounds,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height *0.45, width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: urlImage,
                placeholder: (context, url) => const SizedBox(
                  height: 100, width: 100, child: LoadingCatWidget(),
                ),
                errorWidget: (context, url, error) => Image.asset(cg.pathBadImage, height: 50, width: 50,),
              ),
              ),
              Expanded(
                  child: Container(
                    color: cg.cBackgroundCard,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                      child: ListView(
                        children: [
                          if(selectedBreed.altNames != '')const Text('Alternative names:', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                          if(selectedBreed.altNames != '')const SizedBox(height: 5,),
                          if(selectedBreed.altNames != '')Text(selectedBreed.altNames, style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 12)),
                          if(selectedBreed.altNames != '')const Divider(),
                          const Text('Description:', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 5,),
                          Text(selectedBreed.description, style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 12)),
                          const Divider(),
                          const Text('Temperament:', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 5,),
                          Text(selectedBreed.temperament, style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 12)),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Origin:', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(width: 10,),
                              Flag.fromString(selectedBreed.countryCode, height: 15, width: 15),
                              const SizedBox(width: 5,),
                              Text(selectedBreed.origin, style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 13)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Intelligence level:', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(width: 10,),
                              const Icon(Icons.lightbulb, size: 15, color: cg.cBackgrounds,),
                              const SizedBox(width: 5,),
                              Text(selectedBreed.intelligence.toString(), style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 13)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Adaptability level:', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(width: 10,),
                              const Icon(Icons.wb_cloudy_sharp, size: 15, color: cg.cBackgrounds,),
                              const SizedBox(width: 5,),
                              Text(selectedBreed.adaptability.toString(), style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 13)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Lifespan: ', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(width: 10,),
                              const Icon(Icons.timer, size: 15, color: cg.cBackgrounds,),
                              const SizedBox(width: 5,),
                              Text('${selectedBreed.lifeSpan} years', style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 13)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Energy level:', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(width: 10,),
                              const Icon(Icons.battery_4_bar, size: 15, color: cg.cBackgrounds,),
                              const SizedBox(width: 5,),
                              Text(selectedBreed.energyLevel.toString(), style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 13)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Child friendly level:', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(width: 10,),
                              const Icon(Icons.child_care, size: 15, color: cg.cBackgrounds,),
                              const SizedBox(width: 5,),
                              Text(selectedBreed.childFriendly.toString(), style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 13)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Dog friendly level:', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(width: 10,),
                              const Icon(Icons.pets_rounded, size: 15, color: cg.cBackgrounds,),
                              const SizedBox(width: 5,),
                              Text(selectedBreed.dogFriendly.toString(), style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 13)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Friendly with strangers level: ', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(width: 10,),
                              const Icon(Icons.person, size: 15, color: cg.cBackgrounds,),
                              const SizedBox(width: 5,),
                              Text(selectedBreed.strangerFriendly.toString(), style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 13)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Weight (kg): ', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(width: 10,),
                              const Icon(Icons.balance, size: 15, color: cg.cBackgrounds,),
                              const SizedBox(width: 5,),
                              Text(selectedBreed.weight.metric, style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 13)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text('Weight (lbs): ', style: TextStyle(color: cg.cTextBackgrounds, fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(width: 10,),
                              const Icon(Icons.balance_rounded, size: 15, color: cg.cBackgrounds,),
                              const SizedBox(width: 5,),
                              Text(selectedBreed.weight.imperial, style: const TextStyle(color: cg.cTextBackgroundCard, fontSize: 13)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}