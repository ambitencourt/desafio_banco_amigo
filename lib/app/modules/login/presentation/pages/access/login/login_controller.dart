import 'package:banco_amigo/app/common/entities/login_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../common/stores/user_store.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/usecases/sign_in_usecase.dart';

class LoginController {
  final UserStore userStore;
  final SignInUsecase signIn;

  LoginController({required this.userStore, required this.signIn});

  Future<void> login(UserEntity user) async {
    final userRegistered = await signIn(user);
    userStore.setUser(LoginEntity(
      id: userRegistered.id,
      accountNumber: userRegistered.accountNumber ?? '',
      name: userRegistered.name ?? '',
      email: userRegistered.email,
      password: userRegistered.password,
      document: userRegistered.document ?? '',
      balance: userRegistered.balance,
    ));

    Modular.to.pushReplacementNamed('/bank/home');
  }
}
