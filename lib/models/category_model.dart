// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String slug;
  final String name;
  final String url;

  const CategoryModel({
    required this.slug,
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'slug': slug,
      'name': name,
      'url': url,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      slug: map['slug'] as String,
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [slug, name, url];
}
