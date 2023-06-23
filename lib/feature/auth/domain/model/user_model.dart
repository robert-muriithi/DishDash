import 'package:equatable/equatable.dart';


class UserModel extends Equatable {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoUrl;

  const  UserModel({
      required this.uid,
      required this.email,
      this.displayName,
      this.photoUrl,
    });

    @override
    List<Object?> get props => [uid, email, displayName, photoUrl];


}