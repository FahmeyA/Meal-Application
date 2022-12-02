
import 'package:flutter/material.dart';

import '../Models/meal.dart';
import '../Widgets/meal_iteams.dart';

class FavoirateScreen extends StatefulWidget {
  List<Meal2> favoriteMeals;
   FavoirateScreen({Key? key,required this.favoriteMeals}) : super(key: key);

  @override
  State<FavoirateScreen> createState() => _FavoirateScreenState();
}

class _FavoirateScreenState extends State<FavoirateScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.favoriteMeals.isEmpty)
      {
        return Center(

        );
      }
    else{
     return ListView.builder(
          itemCount:widget.favoriteMeals.length,
          itemBuilder: (ctx,index){
            return  MealItem(
                  (va){

              },
              id: widget.favoriteMeals[index].id,
              title: widget.favoriteMeals[index].title,
              categories:widget.favoriteMeals[index].categories,
              ingredients: widget.favoriteMeals[index].ingredients,
              steps: widget.favoriteMeals[index].steps,
              imageUrl:widget.favoriteMeals[index].imageUrl,
              duration: widget.favoriteMeals[index].duration,
              complexity:widget.favoriteMeals[index].complexity,
              affordability: widget.favoriteMeals[index].affordability,

            );

          });
    }
  }
}
