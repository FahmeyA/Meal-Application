
import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/constant.dart';

import '../Models/meal.dart';
import '../Screen/catagory_meal_screen.dart';

class CatagorayItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final List<Meal2> availableMeal;
  CatagorayItems({Key? key,required this.id,required this.title,required this.color,required this.availableMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      Navigator.of(context).push(

        MaterialPageRoute(builder: (context){
          return CatagorayMealScreen(title: title,id: id,availableMeal:availableMeal ,);
        })
      );


      //
      // pushNamed(catagorayMealScreen,arguments: {
      //   "id":id,
      //   "title":title
      // });
      },
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
               color,
              Colors.indigoAccent.withOpacity(0.4)

            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
          
        ),
        child: Text(title,style: Theme.of(context).textTheme.headline1,),

      ),


    );
  }
}
