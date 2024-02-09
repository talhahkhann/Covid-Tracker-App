import 'dart:convert';

import 'package:covid_app/Models/world_states_model.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<world_states_model> fetchWorldStatesRecords() async {
    final response = await http
        .get(Uri.parse("https://api.covidtracking.com/v1/us/20200501.json"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return world_states_model.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<List<dynamic>> countryList() async {
    var data;
    final response = await http
        .get(Uri.parse("https://api.covidtracking.com/v1/states/daily.json"));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error");
    }
  }
}
