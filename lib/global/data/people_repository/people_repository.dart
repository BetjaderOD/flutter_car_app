import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/global/data/person_model.dart';

class PeopleRepository {
  final String apiUrl;
  final String accessToken;

  PeopleRepository({required this.apiUrl, required this.accessToken});

  Future<void> createPeople(PeopleModel people) async {
    final response = await http.post(
      Uri.parse('$apiUrl/people'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: json.encode(people.toJson()..remove('id')),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al crear el usuario');
    }
  }

  Future<PeopleModel> getUsers(String id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/people/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al obtener los usuarios');
    } else {
      return PeopleModel.fromJson(json.decode(response.body));
    }
  }

  Future<void> updatePeople(PeopleModel people) async {
    final response = await http.put(
      Uri.parse('$apiUrl/people'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: json.encode(people.toJson()..remove('id')),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar el usuario');
    }
  }

  Future<void> deletePeople(String id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/people/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Error al eliminar el usuario');
    }
  }

  Future<List<PeopleModel>> getAllPeople() async {
    final response = await http.get(
      Uri.parse('$apiUrl/people/all'),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al obtener los usuarios');
    } else {
      return List<PeopleModel>.from(json.decode(response.body).map((people) => PeopleModel.fromJson(people)));
    }
  }

  Future<List<PeopleModel>> getPeopleByName(String name) async {
    final response = await http.get(
      Uri.parse('$apiUrl/people?name=$name'),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al obtener los usuarios');
    } else {
      return List<PeopleModel>.from(json.decode(response.body).map((people) => PeopleModel.fromJson(people)));
    }
  }

  Future<List<PeopleModel>> getPeopleByGender(String gender) async {
    final response = await http.get(
      Uri.parse('$apiUrl/people?gender=$gender'),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al obtener los usuarios');
    } else {
      return List<PeopleModel>.from(json.decode(response.body).map((people) => PeopleModel.fromJson(people)));
    }
  }
}
