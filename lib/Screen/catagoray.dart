

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/meal.dart';
import '../Widgets/catagoray_item.dart';
import '../dummy_data.dart';

class CatagoraiesScreen extends StatelessWidget {
  final List<Meal2> availableMeal;
  const CatagoraiesScreen({Key? key,required this.availableMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Colors.grey.shade200,



body: Container(
  color: Theme.of(context).accentColor,
  child:   GridView(


    padding: EdgeInsets.all(25),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

      mainAxisSpacing: 20,
      childAspectRatio: 3/2,
      crossAxisSpacing: 20,
      maxCrossAxisExtent: 200
    ),

    children: DUMMY_CATEGORIES.map((item) {
      return CatagorayItems(title: item.title,id: item.id,color: item.color,availableMeal:availableMeal,);
    }).toList(),
  ),
),
    );
  }
}
