import 'dart:convert';

import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String id;
  final String image;
  final List<SubCategoryModel> subCategories;
  final bool isFeatured;
  final String name;
  final String slug;

  const CategoryModel({
    required this.id,
    required this.image,
    required this.subCategories,
    required this.isFeatured,
    required this.name,
    required this.slug,
  });

  factory CategoryModel.init() {
    return const CategoryModel(
      id: '',
      image: '',
      subCategories: [],
      isFeatured: false,
      name: '',
      slug: '',
    );
  }

  CategoryModel copyWith({
    String? id,
    String? image,
    List<SubCategoryModel>? subCategories,
    bool? isFeatured,
    String? name,
    String? slug,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      image: image ?? this.image,
      subCategories: subCategories ?? this.subCategories,
      isFeatured: isFeatured ?? this.isFeatured,
      name: name ?? this.name,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'image': image,
      'subCategories': subCategories.map((x) => x.toMap()).toList(),
      'isFeatured': isFeatured,
      'name': name,
      'slug': slug,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      image: map['image'] ?? '',
      subCategories: List<SubCategoryModel>.from(
          map['subCategories']?.map((x) => SubCategoryModel.fromMap(x)) ??
              const []),
      isFeatured: map['isFeatured'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CATEGORY_LIST(_id: $id, image: $image, subCategories: $subCategories, isFeatured: $isFeatured, name: $name, slug: $slug)';
  }

  @override
  List<Object> get props {
    return [
      id,
      image,
      subCategories,
      isFeatured,
      name,
      slug,
    ];
  }
}

class SubCategoryModel extends Equatable {
  final String id;
  final String image;
  final List<SubSubCategoryModel> subSubCategories;
  final bool isFeatured;
  final String name;
  final String slug;

  const SubCategoryModel({
    required this.id,
    required this.image,
    required this.subSubCategories,
    required this.isFeatured,
    required this.name,
    required this.slug,
  });

  factory SubCategoryModel.init() {
    return const SubCategoryModel(
      id: '',
      image: '',
      subSubCategories: [],
      isFeatured: false,
      name: '',
      slug: '',
    );
  }

  SubCategoryModel copyWith({
    String? id,
    String? image,
    List<SubSubCategoryModel>? subSubCategories,
    bool? isFeatured,
    String? name,
    String? slug,
  }) {
    return SubCategoryModel(
      id: id ?? this.id,
      image: image ?? this.image,
      subSubCategories: subSubCategories ?? this.subSubCategories,
      isFeatured: isFeatured ?? this.isFeatured,
      name: name ?? this.name,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'image': image,
      'subSubCategories': subSubCategories.map((x) => x.toMap()).toList(),
      'isFeatured': isFeatured,
      'name': name,
      'slug': slug,
    };
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['_id'] ?? '',
      image: map['image'] ?? '',
      subSubCategories: List<SubSubCategoryModel>.from(
          map['subSubCategories']?.map((x) => SubSubCategoryModel.fromMap(x)) ??
              const []),
      isFeatured: map['isFeatured'] ?? false,
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryModel.fromJson(String source) =>
      SubCategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubCategorie(_id: $id, image: $image, subSubCategories: $subSubCategories, isFeatured: $isFeatured, name: $name, slug: $slug)';
  }

  @override
  List<Object> get props {
    return [
      id,
      image,
      subSubCategories,
      isFeatured,
      name,
      slug,
    ];
  }
}

class SubSubCategoryModel extends Equatable {
  final String id;
  final String image;
  final bool isFeatured;
  final String name;
  final String slug;

  const SubSubCategoryModel({
    required this.id,
    required this.image,
    required this.isFeatured,
    required this.name,
    required this.slug,
  });

  factory SubSubCategoryModel.init() {
    return const SubSubCategoryModel(
      id: '',
      image: '',
      isFeatured: false,
      name: '',
      slug: '',
    );
  }

  SubSubCategoryModel copyWith({
    String? id,
    String? image,
    bool? isFeatured,
    String? name,
    String? slug,
  }) {
    return SubSubCategoryModel(
      id: id ?? this.id,
      image: image ?? this.image,
      isFeatured: isFeatured ?? this.isFeatured,
      name: name ?? this.name,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'image': image,
      'isFeatured': isFeatured,
      'name': name,
      'slug': slug,
    };
  }

  factory SubSubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubSubCategoryModel(
      id: map['_id'] ?? '',
      image: map['image'] ?? '',
      isFeatured: map['isFeatured'] ?? false,
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SubSubCategoryModel.fromJson(String source) =>
      SubSubCategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubSubCategorie(_id: $id, image: $image, isFeatured: $isFeatured, name: $name, slug: $slug)';
  }

  @override
  List<Object> get props {
    return [
      id,
      image,
      isFeatured,
      name,
      slug,
    ];
  }
}
