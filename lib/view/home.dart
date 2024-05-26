import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/drink_list_cubit.dart';
import '../controller/home_screen_controller.dart';
import '../model/drink_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final HomeScreenController _controller = HomeScreenController();
  DrinksCubit drinksCubit = DrinksCubit();

  @override
  void initState() {
    super.initState();
    _controller.fetchDrinks(drinksCubit);
  }

  @override
  Widget build(BuildContext context) {
    //روساليه حنطو
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime.shade50,
        title: const Text(
          'Drinks bar',
          style: TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: _buildDrinkMenu(),
      backgroundColor: Colors.lime.shade50,
    );
  }

  Widget _buildDrinkMenu() {
    //ليليان شحرور
    return BlocBuilder<DrinksCubit, List<Drink>>(
      bloc: drinksCubit,
      builder: (context, drinks) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14.0,
          ),
          itemCount: drinks.length,
          itemBuilder: (context, index) => _buildDrinkCard(drinks[index]),
        );
      },
    );
  }

  Widget _buildDrinkCard(Drink drink) {
    //شذا منصور
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: Image.network(
                  drink.image,
                  fit: BoxFit.cover,
                ).image,
              ),
            ),
          ),
          // شيم ديب
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.lightGreen.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                drink.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
