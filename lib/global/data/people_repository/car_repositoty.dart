import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/car_model.dart';

class CarRepository {
  final String apiUrl;

  CarRepository({required this.apiUrl});

  Future<void> createCar(CarModel car) async {
    final response = await http.post(
      Uri.parse('$apiUrl/create'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(car.toJson()
        ..remove('id')),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al crear el carro');
    }
  }


  Future<List<CarModel>> getCars() async {
    final response = await http.get(
      Uri.parse('$apiUrl/get'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Error al obtener los carros');
    } else {

      print(response.body);

      final jsonResponse = json.decode(response.body);

      if (jsonResponse is Map && jsonResponse.containsKey('Cars')) {
        final carsJson = jsonResponse['Cars'] as List;
        return carsJson.map((car) => CarModel.fromJson(car)).toList();
      } else {
        throw Exception('Error al obtener los carros, no es formato json');
      }
    }
  }


  Future<void> updateCar(CarModel car) async {
    final response = await http.put(
      Uri.parse('$apiUrl/update'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(car.toJson()..remove('id')),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar el carro');
    }
  }

  Future<void> deleteCar(String id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/delete/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Error al eliminar el carro');
    }
  }


}