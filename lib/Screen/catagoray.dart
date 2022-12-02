

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/meal.dart';
import '../Widgets/catagoray_item.dart';
import '../dummy_data.dart';
import 'meal_detail.dart';

class CatagoraiesScreen extends StatefulWidget {
  final List<Meal2> availableMeal;
  const CatagoraiesScreen({Key? key,required this.availableMeal}) : super(key: key);

  @override
  State<CatagoraiesScreen> createState() => _CatagoraiesScreenState();
}

class _CatagoraiesScreenState extends State<CatagoraiesScreen> {
  // final Function(String id,  title)  saveIdandTitle;
   String id='c1';
  String title='Italian';
  @override
  late List<Meal2> displayMeals;
  initState(){
    super.initState();


    displayMeals=DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
   // print(displayMeals[2].title);
    // displayMeals=widget.availableMeal;

  }
  Widget build(BuildContext context) {

    return  Container(
        padding: const EdgeInsets.all(8),
        color: Theme.of(context).accentColor,
        child: Column(
          children: [
            const MyAppBar(),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: 300,
              height: 100,
              child: Text(
                "Find the best coffee for you",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SearchBar(),
            const SizedBox(
              height: 20,
            ),
            CoffeeTypeWidget((id1,tital1){
              print(id1);
              print(tital1);
              setState((){
                id=id1;
                title=tital1;
              });
            }),
            const SizedBox(
              height: 10,
            ),
            CoffeeRow(title:title ,id: id,availableMeal: widget.availableMeal),
            // Expanded(child:  GridView(
            //
            //
            //   padding: EdgeInsets.all(25),
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //
            //       mainAxisSpacing: 20,
            //       childAspectRatio: 3/2,
            //       crossAxisSpacing: 20,
            //       maxCrossAxisExtent: 200
            //   ),
            //
            //   children: DUMMY_CATEGORIES.map((item) {
            //     return CatagorayItems(title: item.title,id: item.id,color: item.color,availableMeal:availableMeal,);
            //   }).toList(),
            // ),)

          ],
        )
    );
  }
}


class CoffeeTypeWidget extends StatefulWidget {
  Function(String id,String title) onTap1;
  CoffeeTypeWidget(this.onTap1,{
    Key? key

  }) : super(key: key);

  @override
  State<CoffeeTypeWidget> createState() => _CoffeeTypeWidgetState();
}

class _CoffeeTypeWidgetState extends State<CoffeeTypeWidget> {

int? indexxx;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {

          return InkWell(
            onTap: (){


              widget.onTap1(DUMMY_CATEGORIES[index].id,DUMMY_CATEGORIES[index].title);
              setState((){
                indexxx=index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DUMMY_CATEGORIES[index].title,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: indexxx!=null&& indexxx==index

                        ? Colors.orange
                            : const Color.fromARGB(255, 129, 125, 125),
                        fontSize: 20),
                  ),
                  if (indexxx!=null&& indexxx==index)
                    SizedBox(
                        width: 10,
                        height: 10,
                        child: CircleAvatar(
                          backgroundColor:  Colors.orange,
                        ))
                ],
              ),
            ),
          );
        }),
        itemCount: DUMMY_CATEGORIES.length,
      ),
    );
  }
}


class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          enabled: true,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Find your coffee..",
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
            ),
            icon: Icon(
              Icons.search,
              size: 25,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}


class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ModrenButton(
          icon: Icons.grid_view_rounded,
        ),
        Container(
          padding: const EdgeInsets.all(6),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0XFFffFAEDF0),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/le.jpg",
                fit: BoxFit.fill,
              )),
        )
      ],
    );
  }
}