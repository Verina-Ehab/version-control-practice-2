import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:trial/core/extensions/build_context_extensions.dart';

import '../../../../core/widgets/centered_circular_progress_indicator.dart';
import '../bloc/change_email_address/change_email_address_cubit.dart';

class ChangeEmailAddressButton extends StatelessWidget {
  const ChangeEmailAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeEmailAddressCubit, ChangeEmailAddressState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CenteredCircularProgressIndicator()
            : ElevatedButton(
                onPressed: state.isValid
                    ? () {
                        context.closeKeyboard();
                        context.read<ChangeEmailAddressCubit>().submitForm();
                      }
                    : null,
                child: const Text('Send instructions'),
              );
      },
    );
  }
}
