import '../repositories/bank_repository_interface.dart';

class WithdrawUsecase {
  final IBankRepository bankrepository;

  WithdrawUsecase({required this.bankrepository});

  Future call({
    required String id,
    required double value,
  }) {
    return bankrepository.withdraw(
      id: id,
      value: value,
    );
  }
}
