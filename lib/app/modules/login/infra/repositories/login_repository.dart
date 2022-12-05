import 'package:banco_amigo/app/modules/login/infra/repositories/models/user_model.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/login_repository_interface.dart';
import 'datasource/login_datasource_interface.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource datasource;

  LoginRepository({
    required this.datasource,
  });

  @override
  Future<UserEntity> signIn(UserEntity user) async {
    final request = UserModel(
      document: user.document,
      birthday: user.birthday,
      email: user.email,
      id: user.id,
      name: user.name,
      password: user.password,
      accountNumber: user.accountNumber,
    );
    return datasource.signIn(request);
  }

  @override
  Future<UserEntity> signUp(UserEntity user) async {
    final request = UserModel(
      document: user.document,
      birthday: user.birthday,
      email: user.email,
      id: user.id,
      name: user.name,
      password: user.password,
      accountNumber: user.accountNumber,
    );
    return datasource.signUp(request);
  }
}
