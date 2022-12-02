
import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/constant.dart';

import '../Models/meal.dart';
import '../Screen/meal_detail.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final String imageUrl;
  final int duration;
  final Complexity1 complexity;
  final Affordability1 affordability;
  final Function(String ) removeItem;
   MealItem(this.removeItem,{
   required this.id,
     required this.title,
     required this.categories,
     required this.ingredients,
     required this.steps,
     required this.imageUrl,
     required this.duration,
     required this.complexity,
     required this.affordability,




  } ) ;


  String get complexityString {
    if (complexity == Complexity1.Simple) {
      return "Simple";
    }
    if (complexity == Complexity1.Challenging) {
      return "Challenging";
    }
    if (complexity == Complexity1.Hard) {
      return "Hard";
    }
    else
      return "Unknown";
  }
  String get affordabilityString {
    if (affordability == Affordability1.Luxurious) {
      return "Luxurious";
    }
    if (affordability == Affordability1.Pricey) {
      return "Pricey";
    }
    if (affordability == Affordability1.Affordable) {
      return "Affordable";
    }
    else
      return "Unknown";
  }


  TextStyle style=TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w500
  );
  Color color=Colors.black;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
       Navigator.of(context).pushNamed(MealDetail.mealDetailScreen,
       arguments: id
       ).then((result) {
         if(result!=null)
           removeItem(result as String);
        }
       );
      },
      child: Card(
        color:  Color(0XFFffFAEDF0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),

        child: Column(
          children: [

            Stack(

              children: [

                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft:   Radius.circular(15),
                      topRight: Radius.circular(15)
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/leading.gif',
                    image: imageUrl,
                    fit: BoxFit.cover,

                  ),

                ),


                Positioned(
                  bottom: 0,
                  right: -1,
                  child: Container(
                    width: 220,
                    height: 45,
                    decoration: BoxDecoration(
                      color:  Color(0XFFffFAEDF0),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),

                      ),


                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: Text(title,
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.fade,

                    ),
                  ),
                )
              ],
            ),
          Container(
            decoration: BoxDecoration(

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),

              ),

            ),

            child: Padding(padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Icon(Icons.schedule,color: color,),
                    SizedBox(width: 5,),
                    Text(" $complexityString",style: style,)

                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work_outline,color: color,),
                    SizedBox(width: 5,),
                    Text("duration  $duration",style: style,)

                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money_outlined,color: color,),
                    SizedBox(width: 5,),

                    Text("$affordabilityString",style: style,)

                  ],
                )

              ],
            ),
            ),
          )
          ],
        ),
      ),

    );
  }
}




