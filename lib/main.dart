import 'package:country_lister/screen/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CountryListerApp());
}

class CountryListerApp extends StatelessWidget {
  const CountryListerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
