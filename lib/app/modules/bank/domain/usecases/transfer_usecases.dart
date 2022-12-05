import '../repositories/bank_repository_interface.dart';

class TransferUsecase {
  final IBankRepository bankrepository;

  TransferUsecase({required this.bankrepository});

  Future call({
    required String account,
    required String accountDestiny,
    required double value,
  }) {
    return bankrepository.transfer(
      account: account,
      accountDestiny: accountDestiny,
      value: value,
    );
  }
}
