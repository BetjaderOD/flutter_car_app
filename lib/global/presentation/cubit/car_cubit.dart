import 'package:bloc/bloc.dart';
import 'package:flutter_app/global/data/model/car_model.dart';
import 'package:flutter_app/global/data/people_repository/car_repositoty.dart';
import 'package:flutter_app/global/presentation/cubit/car_state.dart';

class CarCubit extends Cubit<CarState>{
  final CarRepository carRepository;
  CarCubit({required this.carRepository}) : super(CarInitial());

  Future<void> createCar(CarModel car) async {
    try {
      emit(CarLoading());
      await carRepository.createCar(car);
     final cars = await carRepository.getCars();
      emit(CarSuccess(car: cars));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  Future<void> getCars() async {
    try {
      emit(CarLoading());
      final cars = await carRepository.getCars();
      emit(CarSuccess(car: cars));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  Future<void> updateCar(CarModel car) async {
    try {
      emit(CarLoading());
      await carRepository.updateCar(car);
      final cars = await carRepository.getCars();
      emit(CarSuccess(car: cars));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }

  Future<void> deleteCar(int id) async {
    try {
      emit(CarLoading());
     final response = await carRepository.deleteCar(id.toString());
      final cars = await carRepository.getCars();
      emit(CarSuccess(car: []));
    } catch (e) {
      emit(CarError(message: e.toString()));
    }
  }



}