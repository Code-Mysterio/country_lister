import 'package:country_lister/models/CountriesModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:country_lister/services/api_service.dart';

final countriesDataProvider = FutureProvider<List<CountriesModel>>((ref) async {
  return ref.watch(countriesProvider).getCountries();
});
