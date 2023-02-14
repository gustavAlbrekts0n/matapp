import 'package:matapp/services/dish.dart';

class DishService {
  static final DishService _instance = DishService._internal();

  // passes the instantiation to the _instance object
  factory DishService() => _instance;

  // initialize variables in here
  DishService._internal() {
    _dish_list = ["hejsan"];
  }

  List _dish_list = [];

  // getter
  List get dish_list => _dish_list;

  // setter
  set dish_list(List value) => dish_list = value;

}