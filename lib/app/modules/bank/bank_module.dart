import 'package:banco_amigo/app/modules/bank/presentation/pages/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/external/bank_datasource.dart';
import 'data/infra/datasources/bank_datasource_interface.dart';
import 'data/infra/repositories/bank_repository.dart';
import 'domain/repositories/bank_repository_interface.dart';
import 'domain/usecases/deposit_usecases.dart';
import 'domain/usecases/transfer_usecases.dart';
import 'domain/usecases/withdraw_usecases.dart';
import 'presentation/pages/home/home_page.dart';

class BankModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController(
              userStore: i(),
              homeStore: i(),
              dialog: i(),
              deposit: i(),
              transfer: i(),
              withdraw: i(),
            )),
        Bind.factory((i) => WithdrawUsecase(bankrepository: i())),
        Bind.factory((i) => TransferUsecase(bankrepository: i())),
        Bind.factory((i) => DepositUsecase(bankrepository: i())),
        Bind.factory<IBankRepository>(
            (i) => BankRepository(bankDatasource: i())),
        Bind.factory<IBankDatasource>((i) => BankDatasource(httpClient: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/home',
            child: (context, args) => HomePage(
                  controller: Modular.get(),
                )),
      ];
}
