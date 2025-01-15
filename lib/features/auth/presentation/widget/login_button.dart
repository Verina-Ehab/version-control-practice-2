import 'package:flutter/material.dart';
import 'package:trial/core/extensions/build_context_extensions.dart';
import 'package:trial/core/widgets/centered_circular_progress_indicator.dart';
import 'package:trial/features/auth/presentation/bloc/login/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CenteredCircularProgressIndicator()
            : ElevatedButton(
                onPressed: state.isValid
                    ? () {
                        context.closeKeyboard();
                        context.read<LoginCubit>().submitForm();
                      }
                    : null,
                child: const Text('Login with email'),
              );
      },
    );
  }
}
