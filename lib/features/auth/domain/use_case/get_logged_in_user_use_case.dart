import 'package:trial/core/use_cases/no_params.dart';
import 'package:trial/core/use_cases/use_case.dart';
import 'package:trial/features/auth/domain/entity/auth_user_entity.dart';
import 'package:trial/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedInUserUseCase extends UseCase<AuthUserEntity?, NoParams> {
  GetLoggedInUserUseCase(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  @override
  AuthUserEntity? execute(NoParams params) {
    return _authRepository.getLoggedInUser();
  }
}
