import 'package:banco_amigo/app/modules/bank/domain/repositories/bank_repository_interface.dart';

import '../datasources/bank_datasource_interface.dart';

class BankRepository implements IBankRepository {
  final IBankDatasource bankDatasource;
  BankRepository({
    required this.bankDatasource,
  });

  @override
  Future deposit({required double value, required String account}) async {
    await bankDatasource.deposit(value: value, account: account);
  }

  @override
  Future transfer(
      {required double value,
      required String account,
      required String accountDestiny}) async {
    // TODO: implement transfer
    await bankDatasource.transfer(
        value: value, account: account, accountDestiny: accountDestiny);
  }

  @override
  Future withdraw({required double value, required String account}) async {
    await bankDatasource.withdraw(value: value, account: account);
  }
}
