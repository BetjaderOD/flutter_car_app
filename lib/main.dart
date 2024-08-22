import 'package:flutter/material.dart';
import 'package:flutter_app/global/data/people_repository/car_repositoty.dart';
import 'package:flutter_app/global/presentation/screen/get_cars_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CarRepository(
            apiUrl: 'https://8kndc5hkf2.execute-api.us-east-2.amazonaws.com/Prod', // Reemplaza con tu URL
            //accessToken: 'your-access-token', // Reemplaza con tu token
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CarListView(),


      ),
    );
  }
}
