

import 'package:DishDash/core/data/dto/search_response_dto.dart';
import 'package:DishDash/core/errors/exceptions.dart';
import 'package:DishDash/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

abstract class SearchRemoteDataSource {
  Future<SearchResponseDto> searchMeal(String query);
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final Dio dio;
  SearchRemoteDataSourceImpl(this.dio);

  @override
  Future<SearchResponseDto> searchMeal(String query) async {
    final log = Logger();
    try{
      final response = await dio.get('${Constants.kBaserUrl}search.php?s=$query');
      if(response.data['meals'] == null){
        throw const ServerException(message: 'No meal found with this name. Please try again.');
      } else{
        return SearchResponseDto.fromJson(response.data);
      }
    } catch (exception){
      throw ServerException(message: exception.toString());
    }
  }

}