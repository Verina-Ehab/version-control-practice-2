import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trial/core/extensions/hive_extensions.dart';

import 'core/app/app.dart';
import 'dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeSupabase();
  await _initializeHive();
  configureDependencyInjection();

  runApp(
    const FlutterSupabaseStarterApp(),
  );
}

Future<void> _initializeSupabase() async {
  await Supabase.initialize(
    url: "https://xleoxuoturzzewfxsmdt.supabase.co",
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhsZW94dW90dXJ6emV3ZnhzbWR0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYwODExODgsImV4cCI6MjA1MTY1NzE4OH0.-AGnZZ7dvPnyfhNel2GVDC364Q9LPBNdmR8GmbuPkFs',
  );
}

Future<void> _initializeHive() async {
  await Hive.initFlutter();
  await Hive.openThemeModeBox();
}
