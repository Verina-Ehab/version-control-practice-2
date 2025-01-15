import 'package:flutter/material.dart';
import 'package:trial/features/theme_mode/presentation/bloc/theme_mode_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ThemeExtension on BuildContext {
  ThemeMode get watchCurrentThemeMode {
    return watch<ThemeModeCubit>().state.selectedThemeMode;
  }
}
