import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/drink_item.dart';

//  نينار صالح
class DrinkApi {
  Future<List<Drink>> getDrinks() async {
    final response = await http.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'));

    if (response.statusCode == 200) {
      debugPrint("response   ${response.body}");
      final Map<String, dynamic> data = json.decode(response.body);
      //شهد عبد الحميد
      List<Drink> drinks = [];
      for (var item in data['drinks']) {
        drinks.add(Drink(
            id: int.parse(item['idDrink']),
            name: item['strDrink'],
            image: item['strDrinkThumb']));
      }
      return drinks;
    } else {
      throw Exception('Failed to load drinks');
    }
  }
}
