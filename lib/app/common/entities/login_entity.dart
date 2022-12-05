// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class LoginEntity {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String document;
  final String accountNumber;
  final double balance;

  String get formattedBalance {
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    return "R\$ ${formatter.format(balance)}";
  }

  LoginEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.document,
    required this.accountNumber,
    required this.balance,
  });

  LoginEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? document,
    String? accountNumber,
    double? balance,
  }) {
    return LoginEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      document: document ?? this.document,
      accountNumber: accountNumber ?? this.accountNumber,
      balance: balance ?? this.balance,
    );
  }
}
