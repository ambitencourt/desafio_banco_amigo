class UserEntity {
  final String? id;
  final String? name;
  final String email;
  final String password;
  final String? document;
  final String? birthday;
  final String? accountNumber;
  final double balance;

  UserEntity({
    this.id,
    this.name,
    required this.email,
    required this.password,
    this.document,
    this.birthday,
    this.accountNumber,
    this.balance = 0,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? document,
    String? birthday,
    String? accountNumber,
    double? balance,
  }) {
    return UserEntity(
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
}
