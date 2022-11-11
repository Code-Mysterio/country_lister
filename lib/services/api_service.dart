import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:country_lister/models/CountriesModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class APIHelper {
  Future <List<CountriesModel>> getCountries() async {
    try {
      var url = Uri.https('restcountries.com', '/v3.1/all');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        print(response.body);
        return result.map((e) => CountriesModel.fromJson(e)).toList();
      }
      else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

    final countriesProvider = Provider<APIHelper>((ref) => APIHelper());

