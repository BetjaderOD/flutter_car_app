

import 'package:flutter_app/global/data/genre_model.dart';

class PeopleModel {
  final String? id;
  final String name;
  final GenreModel gender;
  final String email;
  final String phone;

  PeopleModel({this.id, required this.name, required this.gender, required
  this.email, required this.phone});

  factory PeopleModel.fromJson(Map<String, dynamic> json) {
    return PeopleModel(
      id: json['id'],
      name: json['name'],
      gender: GenreModel.fromJson(json['genre']),
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'email': email,
      'phone': phone,
    };
  }


}

void main() {
  PeopleModel people =  PeopleModel(
    id: '1',
      name: 'Betjader', email: 'betjaderxd@gmail.com',
      phone: '1234567890', gender: GenreModel(genre: 'hombre'));

  print(people.toJson());
}