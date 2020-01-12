import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

final _auth = FirebaseAuth.instance;

class AuthProvider {
  static Stream<FirebaseUser> userStream = _auth.onAuthStateChanged;

  register(String email, String password, String displayName) async {
    try {
      AuthResult user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserUpdateInfo info = new UserUpdateInfo();
      info.displayName = displayName;
      await user.user.updateProfile(info);
      return user;
    } catch (err) {
      print(err);
    }
  }

  login(String username, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: username, password: password);
      return result;
    } on PlatformException catch (err) {
      print(err.code);
    } catch (err) {
      print(err);
    }
  }

  logout() async {
    await _auth.signOut();
  }
}
