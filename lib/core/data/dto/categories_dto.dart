import 'package:DishDash/feature/home/domain/models/categories_model.dart';

class CategoriesResponseDto {
  List<Categories> categories;

  CategoriesResponseDto({required this.categories});

  factory CategoriesResponseDto.fromJson(Map<String, dynamic> json) {
    return CategoriesResponseDto(
      categories: List<Categories>.from(
          json["categories"].map((x) => Categories.fromJson(x))),
    );
  }
}

class Categories extends CategoriesModel {
  Categories(
      {required super.strCategory,
      required super.strCategoryThumb,
      required super.strCategoryDescription,
      required super.idCategory});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      idCategory: json["idCategory"],
      strCategory: json["strCategory"],
      strCategoryThumb: json["strCategoryThumb"],
      strCategoryDescription: json["strCategoryDescription"],
    );
  }

  Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
      };
}
