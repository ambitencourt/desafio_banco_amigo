import 'package:banco_amigo/app/common/adapters/http_client/http_client_adapter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repositories/datasource/login_datasource_interface.dart';
import '../repositories/models/user_model.dart';

class LoginDatasource implements ILoginDatasource {
  final IHttpClientAdapter _httpClient;

  LoginDatasource({required IHttpClientAdapter httpClient})
      : _httpClient = httpClient;

  @override
  Future<UserModel> signIn(UserModel user) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      var response = await _httpClient.get(
        '/user/signin/${credential.user?.uid ?? ''}',
      );

      var userLogged = UserModel.fromMap(response.data);

      return userLogged;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp(UserModel user) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      var response = await _httpClient.post(
        '/user/signup',
        data: user.copyWith(id: credential.user?.uid ?? '').toJson(),
      );

      var userRegistered = UserModel.fromMap(response.data);

      return userRegistered;
    } catch (e) {
      rethrow;
    }
  }
}
