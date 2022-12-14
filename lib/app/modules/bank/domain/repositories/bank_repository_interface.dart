abstract class IBankRepository {
  Future transfer({
    required double value,
    required String account,
    required String accountDestiny,
  });
  Future withdraw({
    required double value,
    required String id,
  });
  Future deposit({
    required double value,
    required String id,
  });
}
