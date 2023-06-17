import 'package:DishDash/core/data/dto/categories_dto.dart';
import 'package:DishDash/core/errors/exceptions.dart';
import 'package:DishDash/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

abstract class CategoriesRemoteDataSource {
  Future<CategoriesResponseDto> getMealCategories();
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final Dio dio;

  CategoriesRemoteDataSourceImpl(this.dio);

  @override
  Future<CategoriesResponseDto> getMealCategories() async {
    final log = Logger();
    try{
      final response = await dio.get(
        '${Constants.kBaserUrl}categories.php',
      );
      return CategoriesResponseDto.fromJson(response.data);
    }catch (exception){
      log.e(exception.toString());
      throw ServerException(message: exception.toString());
    }
  }

}
