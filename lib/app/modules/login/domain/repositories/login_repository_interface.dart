import '../entities/user_entity.dart';

abstract class ILoginRepository {
  Future<UserEntity> signIn(UserEntity user);
  Future<UserEntity> signUp(UserEntity user);
}
