import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/login_repository_interface.dart';
import 'domain/usecases/sign_in_usecase.dart';
import 'domain/usecases/sign_up_usecase.dart';
import 'infra/datasources/login_datasource.dart';
import 'infra/repositories/datasource/login_datasource_interface.dart';
import 'infra/repositories/login_repository.dart';
import 'presentation/pages/access/login/login_controller.dart';
import 'presentation/pages/access/login/login_page.dart';
import 'presentation/pages/access/register/register_controller.dart';
import 'presentation/pages/access/register/register_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => RegisterController(signUp: i(), userStore: i())),
        Bind.factory((i) => LoginController(signIn: i(), userStore: i())),
        Bind.factory((i) => SignUpUsecase(i())),
        Bind.factory((i) => SignInUsecase(i())),
        Bind.factory<ILoginRepository>((i) => LoginRepository(datasource: i())),
        Bind.factory<ILoginDatasource>((i) => LoginDatasource(httpClient: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/loginpage',
          child: (context, args) => LoginPage(
            controller: Modular.get(),
          ),
        ),
        ChildRoute(
          '/register',
          child: (context, args) => RegisterPage(controller: Modular.get()),
        ),
      ];
}
