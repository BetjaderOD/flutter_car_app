import 'package:flutter/material.dart';
import 'package:flutter_app/global/data/people_repository/car_repositoty.dart';
import 'package:flutter_app/global/presentation/cubit/car_cubit.dart';
import 'package:flutter_app/global/presentation/cubit/car_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListView extends StatelessWidget{
  const CarListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text('Car List'),
      ),
      body: BlocProvider(
        create:(context) => CarCubit(
          carRepository: RepositoryProvider.of<CarRepository>(context),
        ),
        child: const CarListScreen(),

      )
    );
  }
}

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carCubit = BlocProvider.of<CarCubit>(context);
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            carCubit.getCars();
          },
          child: const Text('Get Cars'),
        ),
        BlocBuilder<CarCubit, CarState>(
          builder: (context, state) {
            if (state is CarLoading) {
              return const CircularProgressIndicator();
            } else if (state is CarSuccess) {
              final cars = state.car;
              return Expanded(
                child: ListView.builder(
                  itemCount: cars.length,
                  itemBuilder: (context, index) {
                    final car = cars[index];
                    return ListTile(
                      title: Text('${car.marca} ${car.modelo}'),
                      subtitle: Text('${car.precio.toString()} - ${car.ceroACien.toString()}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {

                              print('Editar: ${car.id}');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Confirmar Eliminación'),
                                    content: const Text('¿Estás seguro de que quieres eliminar este coche?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Llama al método deleteCar en el Cubit
                                          carCubit.deleteCar(car.id);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Eliminar'),
                                      ),
                                    ],
                                  );
                                },
                                //ds
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (state is CarError) {
              return Text(state.message);
            } else {
              return const Center(child: Text('Presiona el botón para obtener los carros'));
            }
          },
        ),
      ],
    );
  }
}



