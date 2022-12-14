import 'dart:convert';

import 'package:banco_amigo/app/modules/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.password,
    required super.document,
    required super.birthday,
    required super.accountNumber,
    super.balance = 0,
  });

  @override
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? document,
    String? birthday,
    String? accountNumber,
    double? balance,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      document: document ?? this.document,
      birthday: document ?? this.birthday,
      accountNumber: accountNumber ?? this.accountNumber,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id ?? '',
      'name': name ?? '',
      'email': email,
      'password': password,
      'document': document ?? '',
      'birthday': birthday ?? '',
      'accountNumber': accountNumber ?? '',
      'balance': balance,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] ?? '',
      email: map['email'] as String,
      password: map['password'] ?? '',
      document: map['document'] ?? '',
      birthday: map['birthday'] ?? '',
      accountNumber: map['accountNumber'] ?? '',
      balance: map['balance'] != null ? map['balance'] * 1.0 : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
