import '../account_destination_entity.dart';
import '../account_entity.dart';

class DepositEntity {
  final AccountEntity accountEntity;
  final AccountDestinationEntity accountDestinationEntity;
  final int depositValue;
  DepositEntity({
    required this.accountEntity,
    required this.accountDestinationEntity,
    required this.depositValue,
  });
}
