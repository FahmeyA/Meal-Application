

import 'package:flutter/material.dart';

import '../Models/meal.dart';
import '../Widgets/main_drawer.dart';
import 'catagoray.dart';
import 'favoirate_screen.dart';

class TabsScreens extends StatefulWidget {
  List<Meal2> filterListMeal;
   TabsScreens({Key? key,required this.filterListMeal}) : super(key: key);
  static final homeScreen="/";
  @override
  State<TabsScreens> createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  List<Meal2> meals = [];


  int currentIndex = 0;

  initState() {
    super.initState();

    _screen=initialCatagray();
  }



   List<Map<String, dynamic>> ?_screen ;


  initialCatagray() => [
    {
      "screen": CatagoraiesScreen(availableMeal: widget.filterListMeal,),
      "title": "Catagoray"
    },
    {
      "screen": FavoirateScreen(),
      "title": "Favorite"
    }

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text(_screen![currentIndex]["title"],),
      ),

      body: _screen![currentIndex]["screen"],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: (val){
           setState((){
             currentIndex=val;
           });
        },
        items:const [

       BottomNavigationBarItem(
              label: "Catagoray",
              icon: Icon(
            Icons.category_outlined,
            color: Colors.white,

          )),
          BottomNavigationBarItem(
              label: "Favoirate",
              icon: Icon(
                Icons.favorite_outlined,
                color: Colors.white,

              ))
        ],
      ),

      drawer: MyDrawer(),
    );
  }
}
