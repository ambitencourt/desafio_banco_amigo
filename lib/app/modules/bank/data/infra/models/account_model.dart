import 'package:banco_amigo/app/modules/bank/domain/entities/account_entity.dart';

class AccountModel extends AccountEntity {
  AccountModel(
      {required super.bankNumber,
      required super.agencyNumber,
      required super.accountNumber});
}
