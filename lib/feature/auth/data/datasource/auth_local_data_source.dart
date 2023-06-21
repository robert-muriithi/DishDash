import 'dart:convert';

import 'package:DishDash/core/errors/exceptions.dart';
import 'package:DishDash/feature/auth/data/model/user_model_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(UserModelResponse user);
  Future<void> removeUser();
  Future<UserModelResponse?> getUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl(this.sharedPreferences);

  final String userKey = 'user';

  @override
  Future<UserModelResponse?> getUser() async {
    try{
      final user = sharedPreferences.getString(userKey);
      if(user != null){
        return UserModelResponse.fromJson(jsonDecode(user));
      }else{
        return null;
      }
    } catch (e) {
      throw  DatabaseException(message: e.toString());
    }
  }

  @override
  Future<void> removeUser() async  {
    try{
      await sharedPreferences.remove(userKey);
    } catch (e) {
      throw  DatabaseException(message: e.toString());
    }
  }

  @override
  Future<void> saveUser(UserModelResponse user) async  {
    try{
      await sharedPreferences.setString(userKey, jsonEncode(user));
    } catch (e) {
      throw  DatabaseException(message: e.toString());
    }
  }


}
