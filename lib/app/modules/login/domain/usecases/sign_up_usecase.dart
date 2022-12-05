import '../entities/user_entity.dart';
import '../repositories/login_repository_interface.dart';

class SignUpUsecase {
  final ILoginRepository _loginRepository;
  SignUpUsecase(this._loginRepository);

  Future<UserEntity> call(UserEntity user) async {
    return await _loginRepository.signUp(user);
  }
}
