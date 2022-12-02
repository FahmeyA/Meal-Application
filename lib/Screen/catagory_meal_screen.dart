
import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/meal_iteams.dart';

import '../Models/meal.dart';
import '../dummy_data.dart';

class CatagorayMealScreen extends StatefulWidget {
  String title;
  String id;
      
  static final routeName='/catagorayMealScreen';
  final List<Meal2> availableMeal;
   CatagorayMealScreen( this.title, this.id, this.availableMeal) ;

  @override
  State<CatagorayMealScreen> createState() => _CatagorayMealScreenState();
}


class _CatagorayMealScreenState extends State<CatagorayMealScreen> {

   //String? catagorayTitle;
  List<Meal2>  displayMeals=[];
  void removIt(String reslut){

    setState((){
      displayMeals.removeWhere((meal) =>   meal.id==reslut);
    });

  }
  @override
  initState(){
    super.initState();


    displayMeals=DUMMY_MEALS.where((element) {
      return element.categories.contains(widget.id);
    }).toList();
    displayMeals=widget.availableMeal;

  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
      body: ListView.builder(
          itemCount: displayMeals.length,
          itemBuilder: (ctx,index){
        return  MealItem(
              (va){
            removIt(va);
          },
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            categories: displayMeals[index].categories,
            ingredients: displayMeals[index].ingredients,
            steps: displayMeals[index].steps,
            imageUrl:displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            complexity:displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,

        );

      }),
    );
  }
}
