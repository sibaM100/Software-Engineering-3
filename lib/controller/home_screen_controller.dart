import '../model/drink_item.dart';
import 'api.dart';
import 'drink_list_cubit.dart';
//زينب حويجه
class HomeScreenController {
  final DrinkApi _drinkApi = DrinkApi();

  fetchDrinks(DrinksCubit drinksCubit) async {
    try {
      List<Drink> drinks = await _drinkApi.getDrinks();
      drinksCubit.fetchDrinks(drinks);
    } catch (e) {
      print('Exception when calling api   $e');
    }
  }
}
