import '../account_destination_entity.dart';
import '../account_entity.dart';

class TransferEntity {
  final AccountEntity accountEntity;
  final AccountDestinationEntity accountDestinationEntity;
  final int depositValue;
  TransferEntity({
    required this.accountEntity,
    required this.accountDestinationEntity,
    required this.depositValue,
  });
}
