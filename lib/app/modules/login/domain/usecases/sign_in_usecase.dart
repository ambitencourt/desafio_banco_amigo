import '../entities/user_entity.dart';
import '../repositories/login_repository_interface.dart';

class SignInUsecase {
  final ILoginRepository _loginRepository;
  SignInUsecase(this._loginRepository);

  Future<UserEntity> call(UserEntity user) async {
    return await _loginRepository.signIn(user);
  }
}
