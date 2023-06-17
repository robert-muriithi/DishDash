class SearchResponseDto {
  List<Meals> meals;

  SearchResponseDto({required this.meals});

  factory SearchResponseDto.fromJson(Map<String, dynamic> json) {
    return SearchResponseDto(
      meals: List<Meals>.from(json["meals"].map((x) => Meals.fromJson(x))),
    );
  }

}

class Meals {
  String idMeal;
  String strMeal;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String strTags;
  String strYoutube;
  String strIngredient1;
  String strIngredient2;
  String strIngredient3;
  String strIngredient4;
  String strIngredient5;
  String strIngredient6;
  String strIngredient7;
  String strIngredient8;
  String strIngredient9;
  String strIngredient10;
  String strIngredient11;
  String strIngredient12;
  String strIngredient13;
  String strIngredient14;
  String strIngredient15;
  String? strIngredient16;
  String? strIngredient17;
  String? strIngredient18;
  String? strIngredient19;
  String? strIngredient20;
  String strMeasure1;
  String strMeasure2;
  String strMeasure3;
  String strMeasure4;
  String strMeasure5;
  String strMeasure6;
  String strMeasure7;
  String strMeasure8;
  String strMeasure9;
  String strMeasure10;
  String strMeasure11;
  String strMeasure12;
  String strMeasure13;
  String strMeasure14;
  String strMeasure15;
  String? strMeasure16;
  String? strMeasure17;
  String? strMeasure18;
  String? strMeasure19;
  String? strMeasure20;
  String? strSource;

  Meals(
      {
        required this.strTags,
        required this.idMeal,
        required this.strMeal,
        required this.strCategory,
        required this.strArea,
        required this.strInstructions,
        required this.strMealThumb,
        required this.strYoutube,
        required this.strIngredient1,
        required this.strIngredient2,
        required this.strIngredient3,
        required this.strIngredient4,
        required this.strIngredient5,
        required this.strIngredient6,
        required this.strIngredient7,
        required this.strIngredient8,
        required this.strIngredient9,
        required this.strIngredient10,
        required this.strIngredient11,
        required this.strIngredient12,
        required this.strIngredient13,
        required this.strIngredient14,
        required this.strIngredient15,
         this.strIngredient16,
         this.strIngredient17,
         this.strIngredient18,
         this.strIngredient19,
         this.strIngredient20,
        required this.strMeasure1,
        required this.strMeasure2,
        required this.strMeasure3,
        required this.strMeasure4,
        required this.strMeasure5,
        required this.strMeasure6,
        required this.strMeasure7,
        required this.strMeasure8,
        required this.strMeasure9,
        required this.strMeasure10,
        required this.strMeasure11,
        required this.strMeasure12,
        required this.strMeasure13,
        required this.strMeasure14,
        required this.strMeasure15,
         this.strMeasure16,
         this.strMeasure17,
         this.strMeasure18,
         this.strMeasure19,
         this.strMeasure20,
         this.strSource,});

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
    idMeal: json['idMeal'],
    strMeal : json['strMeal'],
    strCategory : json['strCategory'],
    strArea : json['strArea'],
    strInstructions : json['strInstructions'],
    strMealThumb : json['strMealThumb'],
    strTags : json['strTags'],
    strYoutube : json['strYoutube'],
    strIngredient1 : json['strIngredient1'],
    strIngredient2 : json['strIngredient2'],
    strIngredient3 : json['strIngredient3'],
    strIngredient4 : json['strIngredient4'],
    strIngredient5 : json['strIngredient5'],
    strIngredient6 : json['strIngredient6'],
    strIngredient7 : json['strIngredient7'],
    strIngredient8 : json['strIngredient8'],
    strIngredient9 : json['strIngredient9'],
    strIngredient10 : json['strIngredient10'],
    strIngredient11 : json['strIngredient11'],
    strIngredient12 : json['strIngredient12'],
    strIngredient13 : json['strIngredient13'],
    strIngredient14 : json['strIngredient14'],
    strIngredient15 : json['strIngredient15'],
    strIngredient16 : json['strIngredient16'],
    strIngredient17 : json['strIngredient17'],
    strIngredient18 : json['strIngredient18'],
    strIngredient19 : json['strIngredient19'],
    strIngredient20 : json['strIngredient20'],
    strMeasure1 : json['strMeasure1'],
    strMeasure2 : json['strMeasure2'],
    strMeasure3 : json['strMeasure3'],
    strMeasure4 : json['strMeasure4'],
    strMeasure5 : json['strMeasure5'],
    strMeasure6 : json['strMeasure6'],
    strMeasure7 : json['strMeasure7'],
    strMeasure8 : json['strMeasure8'],
    strMeasure9 : json['strMeasure9'],
    strMeasure10 : json['strMeasure10'],
    strMeasure11 : json['strMeasure11'],
    strMeasure12 : json['strMeasure12'],
    strMeasure13 : json['strMeasure13'],
    strMeasure14 : json['strMeasure14'],
    strMeasure15 : json['strMeasure15'],
    strMeasure16 : json['strMeasure16'],
    strMeasure17 : json['strMeasure17'],
    strMeasure18 : json['strMeasure18'],
    strMeasure19 : json['strMeasure19'],
    strMeasure20 : json['strMeasure20'],
    strSource  : json['strSource']
    );
  }

}
