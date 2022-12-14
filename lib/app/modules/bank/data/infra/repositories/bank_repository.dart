import 'package:banco_amigo/app/modules/bank/domain/repositories/bank_repository_interface.dart';

import '../datasources/bank_datasource_interface.dart';

class BankRepository implements IBankRepository {
  final IBankDatasource bankDatasource;
  BankRepository({
    required this.bankDatasource,
  });

  @override
  Future deposit({required double value, required String id}) async {
    await bankDatasource.deposit(value: value, id: id);
  }

  @override
  Future transfer(
      {required double value,
      required String account,
      required String accountDestiny}) async {
    var origin = await bankDatasource.getAccount(account);
    await bankDatasource.withdraw(
        value: origin['balance'] - value, id: origin['id']);
    var destiny = await bankDatasource.getAccount(accountDestiny);
    await bankDatasource.deposit(
        value: destiny['balance'] + value, id: destiny['id']);
  }

  @override
  Future withdraw({required double value, required String id}) async {
    await bankDatasource.withdraw(value: value, id: id);
  }
}
