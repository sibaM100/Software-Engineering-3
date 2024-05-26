import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/drink_item.dart';

//زينب حويجه
class DrinksCubit extends Cubit<List<Drink>>{
  DrinksCubit(): super([]);

  fetchDrinks(List<Drink> drinks)=> emit(drinks);
  clear()=> emit([]);
}