import '../account_entity.dart';

class DraftEntity {
  final AccountEntity accountEntity;
  final int depositValue;
  DraftEntity({
    required this.accountEntity,
    required this.depositValue,
  });
}
