import '../../../../../common/adapters/http_client/http_client_adapter.dart';
import '../../infra/datasources/bank_datasource_interface.dart';

class BankDatasource implements IBankDatasource {
  final IHttpClientAdapter _httpClient;
  BankDatasource({required IHttpClientAdapter httpClient})
      : _httpClient = httpClient;

  @override
  Future deposit({required double value, required String id}) async {
    await _httpClient.patch('/bank/deposit/$id', data: {
      'balance': value,
    });
  }


  Future<Map<String, dynamic>> getAccount(String accountDestiny) async {
    final result = await _httpClient.get('/user?accountNumber=$accountDestiny');
    var account = (result.data as List).first;

    return {
      'id': account['id'],
      'balance': account['balance'],
    };
  }

  @override
  Future withdraw({
    required double value,
    required String id,
  }) async {
    await _httpClient.patch('/bank/withdraw/$id', data: {
      'balance': value,
    });
  }
}
