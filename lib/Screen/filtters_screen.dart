
import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/main_drawer.dart';

class Flitter_Screen extends StatefulWidget {
  static const filtterScreens='/fitterScreens';

  final Function  saveFilters;
  Flitter_Screen(this.saveFilters);
  @override
  State<Flitter_Screen> createState() => _Flitter_ScreenState();
}

class _Flitter_ScreenState extends State<Flitter_Screen> {
   bool isGlutenFree=false;

   bool isLactoseFree=false;

   bool isVegan=false;

   bool isVegetarian=false;



    buildSwitch({
     required String title,
      required String subTitle,
      required bool currentValue,
      required ValueChanged<bool>? upduteValue

    }){
      return  SwitchListTile(
        activeColor:  Color(0xffff6b81),
          title: Text(title),
          subtitle: Text(subTitle),
          value: currentValue,
          onChanged: upduteValue,

      );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("yours Filtters"),
        actions: [
          IconButton(
      onPressed: (){

      },

              icon:Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [


          Container(
           padding: EdgeInsets.all(20),

           child: Text(
             "Adjust your meal selection ",
             style: Theme.of(context).textTheme.headline1,
           ),
          ),
          Expanded(
              child:Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: ListView(

                  children: [


                    buildSwitch(title: "Gluteen-Free",
                        subTitle: "only include gluten-free meals",
                        currentValue: isGlutenFree,
                        upduteValue:  (value){
                          setState((){
                            isGlutenFree=value;

                          });
                        }
                    ),
                    buildSwitch(title: "Lactose-Free",
                        subTitle: "only include Lactose-free meals",
                        currentValue: isLactoseFree,
                        upduteValue:  (value){
                          setState((){
                            isLactoseFree=value;

                          });
                        }
                    ),
                    buildSwitch(title: "Vegan-Free",
                        subTitle: "only include Vegan-free meals",
                        currentValue: isVegan,
                        upduteValue:  (value){
                          setState((){
                            isVegan=value;

                          });
                        }
                    ),
                    buildSwitch(title: "Vegetarian-Free",
                        subTitle: "only include Vegetarian-free meals",
                        currentValue: isVegetarian,

                        upduteValue:  (value){
                          setState((){
                            isVegetarian=value;

                          });
                        }
                    )

]
                ),
              )
          )
        ],

      ),
      drawer: MyDrawer(),
    );
  }
}
