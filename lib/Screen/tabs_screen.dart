

import 'package:flutter/material.dart';

import '../Models/meal.dart';
import '../Widgets/main_drawer.dart';
import 'catagoray.dart';
import 'favoirate_screen.dart';

class TabsScreens extends StatefulWidget {
  List<Meal2> filterListMeal;
  List<Meal2> favoriterListMeal;
   TabsScreens({Key? key,required this.filterListMeal,required this.favoriterListMeal}) : super(key: key);
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
      "screen": FavoirateScreen(favoriteMeals: widget.favoriterListMeal,),
      "title": "Favorite"
    }

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Theme.of(context).canvasColor,
        appBar:currentIndex==1? AppBar(
          title: Text(_screen![currentIndex]["title"],),
        ):null,

        body: _screen![currentIndex]["screen"],

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFFDF6F0),
          onTap: (val){
             setState((){
               currentIndex=val;
              // currentIndex==0? isShowlabl==true:
             });
          },
          selectedLabelStyle:     TextStyle(
            color: Colors.black
          ),
         // showSelectedLabels: isShowlabl,
         // showUnselectedLabels:isUnShowlabl ,
          items: [


         BottomNavigationBarItem(
                label: "Catagoray",

                icon: Icon(
              Icons.category_outlined,
              color: currentIndex==0?Colors.orange: Colors.black45,

            )),
            BottomNavigationBarItem(
                label: "Favoirate",
                icon: Icon(
                  Icons.favorite_outlined,
                  color: currentIndex==1?Colors.orange: Colors.black45,

                ))
          ],
        ),

        drawer: MyDrawer(),
      ),
    );
  }
}
