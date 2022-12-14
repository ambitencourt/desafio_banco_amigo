import 'package:asuka/asuka.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:banco_amigo/app/common/stores/home_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/common/adapters/custom_alerts/asuka/asuka_dialog.dart';
import 'app/common/adapters/custom_alerts/dialog_adapter.dart';
import 'app/common/adapters/http_client/dio/dio_adapter.dart';
import 'app/common/adapters/http_client/http_client_adapter.dart';
import 'app/common/stores/user_store.dart';
import 'app/modules/bank/bank_module.dart';
import 'app/modules/login/login_module.dart';
import 'app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<FShowDialog>((i) => (Widget child) {
              Asuka.showDialog(builder: (context) => child);
            }),
        Bind.factory<FAlert>((i) => (String text) {
              asuka.AsukaSnackbar.alert(text).show();
            }),
        Bind.factory<IDialogAdapter>((i) => AsukaDialog(
              fShowDialog: i<FShowDialog>(),
              fAlert: i<FAlert>(),
            )),
        Bind.factory((i) => Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8080'))),
        Bind.factory<IHttpClientAdapter>((i) => DioAdapter(dio: i())),
        Bind.lazySingleton((i) => UserStore()),
        Bind.lazySingleton((i) => HomeStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/bank', module: BankModule()),
      ];
}
