import 'dart:convert';

class HealthCategory {
  int? id;
  String? name;
  String? imagePath;

  HealthCategory({
    this.id,
    this.name,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
    };
  }

  factory HealthCategory.fromMap(Map<String, dynamic>? map) {
    if (map == null) return HealthCategory();

    return HealthCategory(
      id: map['id'] as int,
      name: map['name'] as String,
      imagePath: map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HealthCategory.fromJson(String source) =>
      HealthCategory.fromMap(json.decode(source) as Map<String,dynamic>);
}

