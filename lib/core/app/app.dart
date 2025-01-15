import 'package:flutter/material.dart';
import 'package:trial/core/app/app_theme.dart';
import 'package:trial/core/router/router.dart';
import 'package:trial/dependency_injection.dart';
import 'package:trial/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:trial/features/theme_mode/presentation/bloc/theme_mode_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlutterSupabaseStarterApp extends StatelessWidget {
  const FlutterSupabaseStarterApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _AppBlocProvider(
      child: BlocBuilder<ThemeModeCubit, ThemeModeState>(
        buildWhen: (previous, current) =>
            previous.selectedThemeMode != current.selectedThemeMode,
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter and Supabase Starter',
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: theme,
            darkTheme: darkTheme,
            themeMode: state.selectedThemeMode,
          );
        },
      ),
    );
  }
}

class _AppBlocProvider extends StatelessWidget {
  const _AppBlocProvider({
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => getIt<AuthBloc>()
              ..add(
                const AuthInitialCheckRequested(),
              )),
        BlocProvider(
          create: (_) => getIt<ThemeModeCubit>()..getCurrentTheme(),
        ),
      ],
      child: child,
    );
  }
}
