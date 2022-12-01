import 'package:flutter/material.dart';
import 'package:meal_app/route.dart';

import 'Models/meal.dart';
import 'Screen/catagoray.dart';
import 'Screen/filtters_screen.dart';
import 'Screen/meal_detail.dart';
import 'Screen/tabs_screen.dart';
import 'Widgets/constant.dart';
import 'dummy_data.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

   MyApp({Key? key,}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String ,bool >_filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
     'vegetarian':false
  };


 List<Meal2> availableMeal=DUMMY_MEALS;
  void _setFilters(Map<String ,bool > _filtersData){

    setState((){
      _filters=_filtersData;
      availableMeal=DUMMY_MEALS.where((meal) {
        if(_filters['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose']! && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan']! && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian']! && !meal.isVegetarian){
          return false;
        }
        return true;

      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

        //onGenerateRoute: RouteApp.generateRoute,
        initialRoute: '/',
      routes: {
        '/':(context)=>TabsScreens(),
        MealDetail.mealDetailScreen:(context)=>MealDetail(),
        Flitter_Screen. filtterScreens:(context)=>Flitter_Screen(_setFilters),
      },




      theme: ThemeData(
        primaryColor: Color(0xffff6b81),
        accentColor: Color(0xfff1f2f6),
        canvasColor:Color(0xfff1f2f6),

     appBarTheme:AppBarTheme(
       color: Color(0xffff6b81),
     ) ,
        textTheme:TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
          headline1: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        ),

      ),

    );
  }
}

