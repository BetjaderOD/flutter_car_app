import 'package:flutter/material.dart';
import 'package:flutter_app/global/data/model/car_model.dart';
import 'package:flutter_app/global/data/people_repository/car_repositoty.dart';
import 'package:flutter_app/global/presentation/cubit/car_cubit.dart';
import 'package:flutter_app/global/presentation/cubit/car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarCreateScreen extends StatefulWidget {
  final CarModel? car;

  const CarCreateScreen({Key? key, this.car}) : super(key: key);

  @override
  _CarCreateScreenState createState() => _CarCreateScreenState();
}

class _CarCreateScreenState extends State<CarCreateScreen> {
  late TextEditingController marcaController;
  late TextEditingController modeloController;
  late TextEditingController precioController;
  late TextEditingController ceroAcienController;

  @override
  void initState() {
    super.initState();

    // Inicializa los controladores con los valores del carro si existen
    marcaController = TextEditingController(text: widget.car?.marca);
    modeloController = TextEditingController(text: widget.car?.modelo);
    precioController = TextEditingController(text: widget.car?.precio.toString());
    ceroAcienController = TextEditingController(text: widget.car?.ceroAcien.toString());
  }

  @override
  void dispose() {
    marcaController.dispose();
    modeloController.dispose();
    precioController.dispose();
    ceroAcienController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final carCubit = BlocProvider.of<CarCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car == null ? 'Crear Coche' : 'Actualizar Coche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: marcaController,
              decoration: const InputDecoration(labelText: 'Marca'),
            ),
            TextField(
              controller: modeloController,
              decoration: const InputDecoration(labelText: 'Modelo'),
            ),
            TextField(
              controller: precioController,
              decoration: const InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: ceroAcienController,
              decoration: const InputDecoration(labelText: '0-100 km/h'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final marca = marcaController.text;
                final modelo = modeloController.text;
                final precio = int.parse(precioController.text);
                final ceroAcien = int.parse(ceroAcienController.text);

                final car = CarModel(
                  id: widget.car?.id ?? 0,
                  marca: marca,
                  modelo: modelo,
                  precio: precio.toDouble(),
                  ceroAcien: ceroAcien,
                );

                if (widget.car == null) {

                  carCubit.createCar(car);
                } else {

                  carCubit.updateCar(car);
                }
              },
              child: Text(widget.car == null ? 'Crear Coche' : 'Actualizar Coche'),
            ),
          ],
        ),
      ),
    );
  }
}
