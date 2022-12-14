import 'dart:math';

import 'package:banco_amigo/app/common/entities/login_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../common/stores/user_store.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/usecases/sign_up_usecase.dart';

class RegisterController {
  final UserStore userStore;
  final SignUpUsecase signUp;

  RegisterController({required this.userStore, required this.signUp});

  Future<void> register(UserEntity user) async {
    final userRegistered = await signUp(user.copyWith(
      accountNumber: Random().nextInt(100110010).toString(),
    ));
    userStore.setUser(LoginEntity(
      id: userRegistered.id,
      name: userRegistered.name ?? '',
      email: userRegistered.email,
      password: userRegistered.password,
      document: userRegistered.document ?? '',
      accountNumber: userRegistered.accountNumber ?? '',
      balance: userRegistered.balance,
    ));
    Modular.to.pushReplacementNamed('/bank/home');
  }
}
