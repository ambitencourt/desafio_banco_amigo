import 'package:flutter/material.dart';

import '../entities/login_entity.dart';

class UserStore extends ValueNotifier<LoginEntity?> {
  UserStore() : super(null);

  setUser(LoginEntity user) {
    value = user;
  }

  logOut() {
    value = null;
  }

  addBalance(double balance) {
    value = value!.copyWith(balance: value!.balance + balance);
  }

  removeBalance(double balance) {
    value = value!.copyWith(balance: value!.balance - balance);
  }
}
