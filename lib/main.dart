import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/view/splashscreen.dart';
import 'controller/drink_list_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //إسراء زوبع
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drinks App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (BuildContext context) => DrinksCubit(),
        child: SplashScreen(),
      ),
    );
  }
}
