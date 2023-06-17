import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/utils/constants.dart';
import 'package:DishDash/feature/home/domain/models/meal_details.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure: ServerFailure serverFailure = failure as ServerFailure;
    return serverFailure.message;
    case DatabaseFailure: return Constants.DATABASE_FAILURE_MESSAGE;
    default: return Constants.UNEXPECTED_FAILURE_MESSAGE;
  }
}

enum UIState { initial, loading, success, error }

extension MealDetailsModelExtension on MealDetailsModel {
  String? getIngredient(int index) {
    switch (index) {
      case 1:
        return strIngredient1;
      case 2:
        return strIngredient2;
      case 3:
        return strIngredient3;
      case 4:
        return strIngredient4;
      case 5:
        return strIngredient5;
      case 6:
        return strIngredient6;
      case 7:
        return strIngredient7;
      case 8:
        return strIngredient8;
      case 9:
        return strIngredient9;
      case 10:
        return strIngredient10;
      case 11:
        return strIngredient11;
      case 12:
        return strIngredient12;
      case 13:
        return strIngredient13;
      case 14:
        return strIngredient14;
      case 15:
        return strIngredient15;
      case 16:
        return strIngredient16;
      case 17:
        return strIngredient17;
      case 18:
        return strIngredient18;
      case 19:
        return strIngredient19;
      case 20:
        return strIngredient20;
      default:
        return null;
    }
  }
}

void launchURL(String url) async {
  try {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}



void generateNumberedPoints(String instructions) {
  final points = instructions.split('\r\n');
  for (var i = 0; i < points.length; i++) {
    final point = points[i];
    final numberedPoint = '${i + 1}. $point';
    print(numberedPoint);
  }
}