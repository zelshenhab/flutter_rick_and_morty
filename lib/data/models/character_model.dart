import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final String location;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.location,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    // ✅ التعامل مع location سواء كانت Map أو String
    final dynamic locData = json['location'];
    String locName = '';
    if (locData is Map) {
      locName = locData['name'] ?? '';
    } else if (locData is String) {
      locName = locData;
    }

    return Character(
      id: json['id'] is String
          ? int.tryParse(json['id']) ?? 0
          : json['id'] ?? 0,
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      gender: json['gender'] ?? '',
      image: json['image'] ?? '',
      location: locName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'gender': gender,
      'image': image,
      // ✅ نخزن location كـ String بس علشان مايحصلش تضارب تاني
      'location': location,
    };
  }

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    species,
    gender,
    image,
    location,
  ];
}
