import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';

// FireBaseUserを返しちゃうと抽象化の意味がないので修正必要
abstract class AbcAuth {
  Future<Response<FirebaseUser>> signInWithEmailAndPassword(
      String email, String password);

  Future<Response<FirebaseUser>> signUpWithEmailAndPassword(
      String email, String password);

  void signout();

  Future<bool> get isLogin;
}

class AuthError {
  final description;
  AuthError({this.description});
}

class Response<T> {
  final AuthError error;
  final T response;

  Response({this.response, this.error}) {
    if (this.response == null && this.error == null) {
      throw Exception("どっちもnullはおかしい");
    }
  }
}

class Auth implements AbcAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // フローが一緒なので並べたい
  Future<Response<FirebaseUser>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final FirebaseUser user = result.user;
      return Response(response: user);
    } on PlatformException catch (error) {
      final errors = error.toString();
      return Response(error: AuthError(description: errors));
    } catch (error) {
      return Response(error: AuthError(description: error.toString()));
    }
  }

  Future<Response<FirebaseUser>> signUpWithEmailAndPassword(
      email, password) async {
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final FirebaseUser user = result.user;
      return Response(response: user);
    } on PlatformException catch (error) {
      final errors = error.toString();
      return Response(error: AuthError(description: errors));
    } catch (error) {
      return Response(error: AuthError(description: error.toString()));
    }
  }

  void signout() {
    auth.signOut();
  }

  Future<bool> get isLogin async {
    final user = await auth.currentUser();
    return user != null;
  }
}
