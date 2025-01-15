import 'package:flutter/material.dart';
import 'package:trial/core/widgets/email_text_field.dart';
import 'package:trial/features/auth/presentation/bloc/login/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginEmailInput extends StatelessWidget {
  const LoginEmailInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return EmailTextField(
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          textInputAction: TextInputAction.done,
          errorText:
              state.email.displayError != null ? "Invalid email address" : null,
        );
      },
    );
  }
}
