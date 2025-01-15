import 'package:flutter/foundation.dart';
import 'package:trial/core/constants/urls.dart';
import 'package:trial/features/user/domain/exception/change_email_address_exception.dart';
import 'package:trial/features/user/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: UserRepository)
class SupabaseUserRepository implements UserRepository {
  SupabaseUserRepository(
    this._supabaseAuth,
    this._functionsClient,
  );

  final GoTrueClient _supabaseAuth;
  final FunctionsClient _functionsClient;

  @override
  Future<void> changeEmailAddress(
    String newEmailAddress,
  ) async {
    try {
      await _supabaseAuth.updateUser(
        UserAttributes(email: newEmailAddress),
        emailRedirectTo: kIsWeb ? null : Urls.changeEmailCallbackUrl,
      );
    } on AuthException catch (error) {
      throw (ChangeEmailAddressException(message: error.message));
    }
  }
}
