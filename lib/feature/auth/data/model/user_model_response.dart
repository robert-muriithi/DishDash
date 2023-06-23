

import 'package:DishDash/feature/auth/domain/model/user_model.dart';

class UserModelResponse extends UserModel {
   const UserModelResponse({
    required super.uid,
    required super.email,
     super.displayName,
     super.photoUrl,
  });

  @override
  List<Object?> get props => [uid, email, displayName, photoUrl];


  @override
  String toJson() => '''
  {
    "uid": "$uid",
    "email": "$email",
    "displayName": "$displayName",
    "photoUrl": "$photoUrl"
  }
  ''';

  factory UserModelResponse.fromJson(String source) {
    return UserModelResponse.fromJson(source);
  }


}