// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  final String name;
  final String description;
  final String imgPath;

  Category(
    this.name,
    this.description,
    this.imgPath,
  );

  Category copyWith({
    String? name,
    String? description,
    String? imgPath,
  }) {
    return Category(
      name ?? this.name,
      description ?? this.description,
      imgPath ?? this.imgPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'imgPath': imgPath,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      map['name'] as String,
      map['description'] as String,
      map['imgPath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Category(name: $name, description: $description, imgPath: $imgPath)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.name == name &&
        other.description == description &&
        other.imgPath == imgPath;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ imgPath.hashCode;
}
