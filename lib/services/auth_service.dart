import 'package:airplane_app/models/user.dart';
import 'package:airplane_app/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    String hobby = '',
  }) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel user = UserModel(
          id: credential.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
          balance: 50000000);

      await UserService().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }
}
