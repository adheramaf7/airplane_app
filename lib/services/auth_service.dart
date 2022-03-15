import 'package:airplane_app/models/user_model.dart';
import 'package:airplane_app/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    String hobby = '',
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
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
      rethrow;
    }
  }

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel user = await UserService().getUserById(credential.user!.uid);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  String? getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }
}
