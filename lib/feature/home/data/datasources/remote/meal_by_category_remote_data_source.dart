import 'package:DishDash/core/data/dto/filter_by_category_dto.dart';
import 'package:DishDash/core/data/dto/meals_details_dto.dart';
import 'package:DishDash/core/errors/exceptions.dart';
import 'package:DishDash/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

abstract class MealByCategoryRemoteDataSource {
  Future<MealsByCategoryDto> getMealByCategory(String category);
  Future<MealDetailsDto> getMealDetails(String id);
}

class MealByCategoryRemoteDataSourceImpl implements MealByCategoryRemoteDataSource {
  final Dio dio;
  MealByCategoryRemoteDataSourceImpl(this.dio);

  @override
  Future<MealsByCategoryDto> getMealByCategory(String category) async {
    final log = Logger();
    try{
      final response = await dio.get(
        '${Constants.kBaserUrl}filter.php',
        queryParameters: {
          'c' : category
        }
      );
      log.d(response.data);
      return MealsByCategoryDto.fromJson(response.data);
    }catch (exception){
      throw ServerException(message: exception.toString());
    }
  }

  @override
  Future<MealDetailsDto> getMealDetails(String id) async {
    final log = Logger();
    try{
      final response = await dio.get(
          '${Constants.kBaserUrl}lookup.php',
          queryParameters: {
            'i' : id
          }
      );
      log.d(response.data);
      return MealDetailsDto.fromJson(response.data);
    }catch (exception){
      throw ServerException(message: exception.toString());
    }
  }
}