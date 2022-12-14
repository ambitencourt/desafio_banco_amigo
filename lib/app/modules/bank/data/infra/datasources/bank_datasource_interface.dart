abstract class IBankDatasource {

  Future withdraw({
    required double value,
    required String id,
  });
  Future deposit({
    required double value,
    required String id,
  });
  Future<Map<String, dynamic>> getAccount(String accountDestiny);
}
