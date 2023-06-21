
import 'package:DishDash/core/errors/exceptions.dart';
import 'package:DishDash/feature/auth/data/model/user_model_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

abstract class FirebaseRemoteDataSource {
  Future<UserModelResponse> login({required String email, required String password});
  Future<String> register({required String email, required String password});
  Future<void> logout();
  Future<String?> getCurrentUser();
  Future<UserModelResponse> signInWithGoogle();
  Future<void> sendPasswordResetEmail({required String email});
}

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  FirebaseRemoteDataSourceImpl(this.firebaseAuth);


  @override
  Future<String?> getCurrentUser() async {
    try{
      final user = firebaseAuth.currentUser;
      if(user != null){
        return user.uid;
      }else{
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const ServerException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw const ServerException(message: 'Wrong password provided for that user.');
      }else{
        throw const ServerException(message: 'Something went wrong');
      }
    } catch (e) {
      throw const ServerException(message: 'Something went wrong');
    }
  }

  @override
  Future<UserModelResponse> login({required String email, required String password}) async {
    try{
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final user = UserModelResponse(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email ?? '',
          displayName: userCredential.user!.displayName ?? '',
          photoUrl: userCredential.user!.photoURL ?? '',
      );
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const ServerException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw const ServerException(message: 'Wrong password provided for that user.');
      }else{
        throw const ServerException(message: 'Something went wrong');
      }
    } catch (e) {
      throw const ServerException(message: 'Something went wrong');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw const ServerException(message: 'Something went wrong');
    }
  }

  @override
  Future<String> register({required String email, required String password}) async {
    try{
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw const ServerException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw const ServerException(message: 'The account already exists for that email.');
      }else{
        throw const ServerException(message: 'Something went wrong');
      }
    } catch (e) {
      throw const ServerException(message: 'Something went wrong');
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try{
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const ServerException(message: 'No user found for that email.');
      }else{
        throw const ServerException(message: 'Something went wrong');
      }
    } catch (e) {
      throw const ServerException(message: 'Something went wrong');
    }
  }

  @override
  Future<UserModelResponse> signInWithGoogle() async {
    final log = Logger();
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await firebaseAuth.signInWithCredential(credential);

      if(userCredential.user != null){
        final user = UserModelResponse(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email ?? '',
          displayName: userCredential.user!.displayName ?? '',
          photoUrl: userCredential.user!.photoURL ?? '',
        );
        log.i(user.displayName);
        return user;
      }else{
        throw const ServerException(message: 'Something went wrong');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const ServerException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw const ServerException(message: 'Wrong password provided for that user.');
      }else{
        throw const ServerException(message: 'An error occurred while accessing Google Sign In.');
      }
    } catch (e) {
      log.e(e.toString());
      throw  ServerException(message: e.toString());
    }
  }

}