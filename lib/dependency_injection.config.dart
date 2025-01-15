// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase/supabase.dart' as _i590;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:trial/core/app/app_module.dart' as _i378;
import 'package:trial/features/auth/data/repository/supabase_auth_repository.dart'
    as _i897;
import 'package:trial/features/auth/domain/repository/auth_repository.dart'
    as _i655;
import 'package:trial/features/auth/domain/use_case/get_current_auth_state_use_case.dart'
    as _i1019;
import 'package:trial/features/auth/domain/use_case/get_logged_in_user_use_case.dart'
    as _i901;
import 'package:trial/features/auth/domain/use_case/login_with_email_use_case.dart'
    as _i75;
import 'package:trial/features/auth/domain/use_case/logout_use_case.dart'
    as _i546;
import 'package:trial/features/auth/presentation/bloc/auth_bloc.dart' as _i618;
import 'package:trial/features/auth/presentation/bloc/login/login_cubit.dart'
    as _i67;
import 'package:trial/features/home/presentation/bloc/bottom_navigation_bar/bottom_navigation_bar_cubit.dart'
    as _i844;
import 'package:trial/features/theme_mode/data/repository/theme_mode_hive_repository.dart'
    as _i423;
import 'package:trial/features/theme_mode/domain/repository/theme_mode_repository.dart'
    as _i826;
import 'package:trial/features/theme_mode/domain/use_case/get_or_set_initial_theme_mode_use_case.dart'
    as _i838;
import 'package:trial/features/theme_mode/domain/use_case/set_theme_mode_id_use_case.dart'
    as _i259;
import 'package:trial/features/theme_mode/presentation/bloc/theme_mode_cubit.dart'
    as _i793;
import 'package:trial/features/user/data/repository/supabase_user_repository.dart'
    as _i415;
import 'package:trial/features/user/domain/repository/user_repository.dart'
    as _i393;
import 'package:trial/features/user/domain/use_case/change_email_address_use_case.dart'
    as _i950;
import 'package:trial/features/user/presentation/bloc/change_email_address/change_email_address_cubit.dart'
    as _i991;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i454.SupabaseClient>(() => appModule.supabaseClient);
    gh.factory<_i454.GoTrueClient>(() => appModule.supabaseAuth);
    gh.factory<_i454.FunctionsClient>(() => appModule.functionsClient);
    gh.factory<_i844.BottomNavigationBarCubit>(
        () => _i844.BottomNavigationBarCubit());
    gh.factory<_i393.UserRepository>(() => _i415.SupabaseUserRepository(
          gh<_i590.GoTrueClient>(),
          gh<_i590.FunctionsClient>(),
        ));
    gh.factory<_i826.ThemeModeRepository>(
        () => _i423.ThemeModeHiveRepository());
    gh.factory<_i838.GetOrSetInitialThemeModeUseCase>(() =>
        _i838.GetOrSetInitialThemeModeUseCase(gh<_i826.ThemeModeRepository>()));
    gh.factory<_i259.SetThemeModeUseCase>(
        () => _i259.SetThemeModeUseCase(gh<_i826.ThemeModeRepository>()));
    gh.factory<_i655.AuthRepository>(
        () => _i897.SupabaseAuthRepository(gh<_i454.GoTrueClient>()));
    gh.factory<_i950.ChangeEmailAddressUseCase>(
        () => _i950.ChangeEmailAddressUseCase(gh<_i393.UserRepository>()));
    gh.factory<_i793.ThemeModeCubit>(() => _i793.ThemeModeCubit(
          gh<_i838.GetOrSetInitialThemeModeUseCase>(),
          gh<_i259.SetThemeModeUseCase>(),
        ));
    gh.factory<_i1019.GetCurrentAuthStateUseCase>(
        () => _i1019.GetCurrentAuthStateUseCase(gh<_i655.AuthRepository>()));
    gh.factory<_i901.GetLoggedInUserUseCase>(
        () => _i901.GetLoggedInUserUseCase(gh<_i655.AuthRepository>()));
    gh.factory<_i75.LoginWithEmailUseCase>(
        () => _i75.LoginWithEmailUseCase(gh<_i655.AuthRepository>()));
    gh.factory<_i546.LogoutUseCase>(
        () => _i546.LogoutUseCase(gh<_i655.AuthRepository>()));
    gh.factory<_i991.ChangeEmailAddressCubit>(() =>
        _i991.ChangeEmailAddressCubit(gh<_i950.ChangeEmailAddressUseCase>()));
    gh.factory<_i67.LoginCubit>(
        () => _i67.LoginCubit(gh<_i75.LoginWithEmailUseCase>()));
    gh.factory<_i618.AuthBloc>(() => _i618.AuthBloc(
          gh<_i901.GetLoggedInUserUseCase>(),
          gh<_i1019.GetCurrentAuthStateUseCase>(),
          gh<_i546.LogoutUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i378.AppModule {}
