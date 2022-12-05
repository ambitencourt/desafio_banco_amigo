import '../../../../../common/adapters/http_client/http_client_adapter.dart';
import '../../infra/datasources/bank_datasource_interface.dart';

class BankDatasource implements IBankDatasource {
  final IHttpClientAdapter _httpClient;
  BankDatasource({required IHttpClientAdapter httpClient})
      : _httpClient = httpClient;

  @override
  Future deposit({required double value, required String account}) async {
    await _httpClient.put('/bank/deposit', data: {
      'value': value,
      'account': account,
    });
  }

  @override
  Future transfer(
      {required double value,
      required String account,
      required String accountDestiny}) async {
    await _httpClient.put('/bank/deposit', data: {
      'value': value,
      'account': account,
      'accountDestiny': accountDestiny,
    });
  }

  @override
  Future withdraw({required double value, required String account}) async {
    await _httpClient.put('/bank/deposit', data: {
      'value': value,
      'account': account,
    });
  }
}
