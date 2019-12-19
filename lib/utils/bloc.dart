import 'dart:async';

import '../models/foodItemList.dart';
// import 'demo-data.dart';

class FoodItemBloc implements BaseBloc {

  final _foodItemController = StreamController<FoodList>();

  Stream<FoodList> get foodItems => _foodItemController.stream; //.transform(foodItemCategory);
  Function(FoodList) get foodItemOut => _foodItemController.sink.add;

  @override
  void dispose() {
    _foodItemController?.close();
  }
}

final foodItemBloc =  FoodItemBloc();

abstract class BaseBloc {
  void dispose();
}