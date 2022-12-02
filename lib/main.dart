import 'package:flutter/material.dart';

import 'Models/meal.dart';
import 'Screen/catagory_meal_screen.dart';
import 'Screen/filtters_screen.dart';
import 'Screen/meal_detail.dart';
import 'Screen/tabs_screen.dart';
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
  List<Meal2> favoriteMeal=[];

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

  void _toggleFavorite(String mealId){
    final mealIndexReturn=favoriteMeal.indexWhere((meal) => meal.id==mealId);
  if(mealIndexReturn>=0){
 setState((){
   favoriteMeal.removeAt(mealIndexReturn);
 });
  }
  else{
     favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) =>meal.id==mealId ));
  }

  }

  bool _isMealFavorite(String mealId){

    return favoriteMeal.any((meal) => meal.id==mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

        //onGenerateRoute: RouteApp.generateRoute,
        initialRoute: '/',
      routes: {
        '/':(context)=>TabsScreens(filterListMeal: availableMeal,favoriterListMeal: favoriteMeal,),
        MealDetail.mealDetailScreen:(context)=>MealDetail(isMealfavoriteMeal: _isMealFavorite,togglefavoriteMeal: _toggleFavorite,),

        Flitter_Screen. filtterScreens:(context)=>Flitter_Screen(cuurentFilter:_filters,saveFilters:_setFilters),
      },




      theme: ThemeData(
        primaryColor: Color(0xFFC69B7B),
        accentColor: Color(0xFFFDF6F0),
        canvasColor:Color(0xFFFDF6F0),//f1f2f6,

     appBarTheme:AppBarTheme(
       color: Color(0xffFAEDF0 ),//0xffff6b81
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

