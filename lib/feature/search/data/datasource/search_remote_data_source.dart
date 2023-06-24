

import 'package:DishDash/core/data/dto/search_response_dto.dart';
import 'package:DishDash/core/errors/exceptions.dart';
import 'package:DishDash/core/utils/constants.dart';
import 'package:dio/dio.dart';

abstract class SearchRemoteDataSource {
  Future<SearchResponseDto> searchMeal(String query);
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final Dio dio;
  SearchRemoteDataSourceImpl(this.dio);

  @override
  Future<SearchResponseDto> searchMeal(String query) async {
    try{
      final response = await dio.get('${Constants.kBaserUrl}search.php?s=$query');
      return SearchResponseDto.fromJson(response.data);
    } catch (exception){
      throw ServerException(message: exception.toString());
    }
  }

}