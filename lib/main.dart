import 'package:country_lister/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:country_lister/utils/const/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: CountryListerApp(),
    ),
  );
}

class CountryListerApp extends ConsumerWidget {
  const CountryListerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        primaryColor: Colors.grey,
        hoverColor: Colors.black,
        focusColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey[600],
        focusColor: Colors.deepOrange,
        hoverColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xFF000F24),
      ),
      themeMode: themeMode,
      home: const HomePage(),
    );
  }
}
