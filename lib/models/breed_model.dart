class Breed {
  final Weight weight;
  final String id;
  final String name;
  final String cfaUrl;
  final String vetstreetUrl;
  final String vcahospitalsUrl;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int lap;
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final String wikipediaUrl;
  final int hypoallergenic;
  final String referenceImageId;

  Breed({
    required this.weight,
    required this.id,
    required this.name,
    required this.cfaUrl,
    required this.vetstreetUrl,
    required this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      weight: Weight.fromJson(json['weight']),
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      cfaUrl: json['cfa_url'] ?? '',
      vetstreetUrl: json['vetstreet_url'] ?? '',
      vcahospitalsUrl: json['vcahospitals_url'] ?? '',
      temperament: json['temperament'] ?? '',
      origin: json['origin'] ?? '',
      countryCodes: json['country_codes'] ?? '',
      countryCode: json['country_code'] ?? '',
      description: json['description'] ?? '',
      lifeSpan: json['life_span'] ?? '',
      indoor: json['indoor'] ?? -1,
      lap: json['lap'] ?? -1,
      altNames: json['alt_names'] ?? '',
      adaptability: json['adaptability'] ?? -1,
      affectionLevel: json['affection_level'] ?? -1,
      childFriendly: json['child_friendly'] ?? -1,
      dogFriendly: json['dog_friendly'] ?? -1,
      energyLevel: json['energy_level'] ?? -1,
      grooming: json['grooming'] ?? -1,
      healthIssues: json['health_issues'] ??-1,
      intelligence: json['intelligence'] ?? -1,
      sheddingLevel: json['shedding_level'] ?? -1,
      socialNeeds: json['social_needs'] ?? -1,
      strangerFriendly: json['stranger_friendly'] ?? -1,
      vocalisation: json['vocalisation'] ?? -1,
      experimental: json['experimental'] ?? -1,
      hairless: json['hairless'] ?? -1,
      natural: json['natural'] ?? -1,
      rare: json['rare'] ?? -1,
      rex: json['rex'] ?? -1,
      suppressedTail: json['suppressed_tail'] ?? -1,
      shortLegs: json['short_legs'] ?? -1,
      wikipediaUrl: json['wikipedia_url'] ?? '',
      hypoallergenic: json['hypoallergenic'] ?? -1,
      referenceImageId: json['reference_image_id'] ?? '',
    );
  }
}

class Weight {
  final String imperial;
  final String metric;

  Weight({required this.imperial, required this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      imperial: json['imperial'],
      metric: json['metric'],
    );
  }
}
