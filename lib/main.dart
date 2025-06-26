import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_colors/src/providers/storage_provider.dart';
import 'package:riverpod_colors/src/screens/home_screen.dart';

void main() async {
  final storageClient = await ProviderContainer().read(
    storageInitProvider.future,
  );
  runApp(
    ProviderScope(
      child: const MainApp(),
      overrides: [
        storageProvider.overrideWith((ref) => storageClient),
      ], //  so now you can access this storageClient var from anywhere in the app
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: const HomeScreen());
  }
}
