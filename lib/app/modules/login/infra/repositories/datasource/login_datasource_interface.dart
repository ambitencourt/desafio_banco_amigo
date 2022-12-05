import '../models/user_model.dart';

abstract class ILoginDatasource {
  Future<UserModel> signIn(UserModel user);
  Future<UserModel> signUp(UserModel user);
}
