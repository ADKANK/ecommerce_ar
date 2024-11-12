class RealEstate {
  final String id;
  final String name;
  final String type;
  final String imageUrl;
  final String modelUrl;
  final String availabilityType;
  final List<Flat> flats;

  RealEstate({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.modelUrl,
    required this.availabilityType,
    required this.flats,
  });

  factory RealEstate.fromJson(Map<String, dynamic> json) {
    var flatList = json['flats'] as List;
    List<Flat> flats = flatList.map((flat) => Flat.fromJson(flat)).toList();

    return RealEstate(
      id: json['_id'],
      name: json['name'],
      type: json['type'],
      imageUrl: json['imageUrl'],
      modelUrl: json['modelUrl'],
      availabilityType: json['availability_type'],
      flats: flats,
    );
  }
}

class Flat {
  final String flatNumber;
  final String status;
  final String id;

  Flat({
    required this.flatNumber,
    required this.status,
    required this.id,
  });

  factory Flat.fromJson(Map<String, dynamic> json) {
    return Flat(
      flatNumber: json['flatNumber'],
      status: json['status'],
      id: json['_id'],
    );
  }
}
