

import 'package:flutter/material.dart';
import 'package:meal_app/color.dart';

import '../Widgets/main_drawer.dart';
import 'catagoray.dart';
import 'favoirate_screen.dart';

class TabsScreens extends StatefulWidget {
  const TabsScreens({Key? key}) : super(key: key);
  static final homeScreen="/";
  @override
  State<TabsScreens> createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {


  int currentIndex=0;

   List<Map<String,dynamic>> _screen=[
    {
      "screen":CatagoraiesScreen(availableMeal: [],),
      "title":"Catagoray"
    },
    {
      "screen":FavoirateScreen(),
      "title":"Favorite"
    }

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text(_screen[currentIndex]["title"],),
      ),

      body: _screen[currentIndex]["screen"],

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
