
import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/constant.dart';

import '../Models/meal.dart';
import '../Screen/catagory_meal_screen.dart';
import '../color.dart';

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
          return CatagorayMealScreen( title, id,availableMeal ,);
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


class CoffeeRow extends StatelessWidget {
  final String id;
  final String title;

  final List<Meal2> availableMeal;
   CoffeeRow({Key? key, required this.id,required this.title,required this.availableMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 310,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(

                  MaterialPageRoute(builder: (context){
                    return CatagorayMealScreen( title, id,availableMeal ,);
                  })

              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  // gradient: LinearGradient(colors: [
                  //   Colors.white.withOpacity(1),
                  //   Colors.white.withOpacity(1),
                  //
                  // ], begin: Alignment.topLeft, end: Alignment.bottomRight,),
           ),
              child: Card(
                elevation: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                width: double.infinity,
                                height: 150,
                                child: Image.network(
                                  availableMeal[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Container(
                            width: 60,
                            height: 25,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        size: 15,
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                      "32",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color:Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            availableMeal[index].title,
                            style: TextStyle(
                              color:Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Text(
                          //   Coffee.coffee[index]["disc"],
                          //   style: const TextStyle(
                          //     color: Colors.grey,
                          //     fontSize: 13,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 47,
                      padding: const EdgeInsets.only(left: 20, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$ ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color:Colors.orange),
                                ),
                                TextSpan(
                                  text: "34",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: MyColor.secondColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: MyColor.secondColor.withOpacity(0.2),
                                    offset: const Offset(0, 2),
                                    blurRadius: 5)
                              ],
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: MyColor.textColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),

              ),
            ),
          );
        },
        itemCount:availableMeal.length,
      ),
    );
  }
}
