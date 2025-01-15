
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/value_objects/email_value_object.dart';
import '../../../domain/exception/login_with_email_exception.dart';
import '../../../domain/use_case/login_with_email_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._loginWithEmailUseCase,
  ) : super(
          const LoginState(),
        );

  final LoginWithEmailUseCase _loginWithEmailUseCase;

  void emailChanged(String value) {
    final email = EmailValueObject.dirty(value);

    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([
        email,
      ]),
    ));
  }

  void submitForm() async {
    if (!state.isValid) return;

    emit(
      state.copyWith(status: FormzSubmissionStatus.inProgress),
    );

    try {
      await _loginWithEmailUseCase.execute(
        LoginWithEmailParams(email: state.email.value),
      );

      emit(
        state.copyWith(status: FormzSubmissionStatus.success),
      );
    } on Exception catch (e) {
      emit(state.copyWith(
        errorMessage: e is LoginWithEmailException ? e.message : null,
        status: FormzSubmissionStatus.failure,
      ));
    }
  }
}
