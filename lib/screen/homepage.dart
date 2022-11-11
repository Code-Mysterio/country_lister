import 'package:country_lister/models/CountriesModel.dart';
import 'package:country_lister/utils/const/provider_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(countriesDataProvider);
    return SafeArea(child: Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
        ),
      ),));
  }
}

