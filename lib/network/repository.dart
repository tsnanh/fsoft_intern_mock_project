import 'dart:convert';

import 'package:fsoft_intern_mock_project/constants/constants.dart';
import 'package:fsoft_intern_mock_project/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  Future<List<Plant>> getListPlant() async {
    final response = await http.get(Constants.PLANT_LIST);
    final List t = jsonDecode(response.body);
    final List<Plant> plants = t.map((e) => Plant.fromJson(e)).toList();

    return plants;
  }

  Future<List<Plant>> getPlantsInUserGarden(String username) async {
    final uri = Uri.http(Constants.AUTHORITY, Constants.GARDEN_ROUTE, {
      "username": username
    });
    final response = await http.get(uri);
    final List t = jsonDecode(response.body);
    final List<Plant> plants = (t ?? []).map((e) => Plant.fromJson(e)).toList();

    print(jsonDecode(response.body));
    return plants;
  }

  Future<String> login(String username) async {
    final response = await http.post(Constants.USER, body: username);
    final name = jsonDecode(response.body)['username'];
    return name;
  }

  Future<bool> addPlantToGarden(String username, int plantId) async {
    final uri = Uri.http(Constants.AUTHORITY, Constants.GARDEN_ROUTE, {
      "username": username,
      "plantId": plantId.toString()
    });
    final response = await http.post(uri);
    print(response.body);
    return jsonDecode(response.body)['success'];
  }

  Future<bool> removePlantFromGarden(String username, int plantId) async {
    final uri = Uri.http(Constants.AUTHORITY, Constants.GARDEN_ROUTE, {
      "username": username,
      "plantId": plantId.toString()
    });
    final response = await http.delete(uri);
    return jsonDecode(response.body)['success'];
  }

  Future<bool> checkIfGardenHasPlant(String username, int plantId) async {
    final uri = Uri.http(Constants.AUTHORITY, Constants.GARDEN_HAS_PLANT_ROUTE, {
      "username": username,
      "plantId": plantId.toString()
    });
    final response = await http.get(uri);
    return jsonDecode(response.body)['hasPlant'];
  }

  Future<Plant> waterTheTree(int plantId) async {
    final uri = Uri.http(Constants.AUTHORITY, Constants.PLANTS_ROUTE, {
      "username": (await SharedPreferences.getInstance()).getString("username"),
      "plantId": plantId.toString()
    });
    final response = await http.put(uri);
    return Plant.fromJson(jsonDecode(response.body)['plant']);
  }

  Future<Plant> getSinglePlantInGarden(int plantId) async {
    final uri = Uri.http(Constants.AUTHORITY, '${Constants.PLANTS_ROUTE}/$plantId', {
      "username": (await SharedPreferences.getInstance()).getString("username"),
    });
    final response = await http.get(uri);
    return Plant.fromJson(jsonDecode(response.body)['plant']);
  }
}
