import '../repositories/bank_repository_interface.dart';

class DepositUsecase {
  final IBankRepository bankrepository;

  DepositUsecase({required this.bankrepository});

  Future call({
    required String id,
    required double value,
  }) {
    return bankrepository.deposit(
      id: id,
      value: value,
    );
  }
}
