
import 'package:flutter/material.dart';

import '../Models/meal.dart';
import '../color.dart';
import '../dummy_data.dart';

class MealDetail extends StatefulWidget {
  static final mealDetailScreen='/MealDetailScreen';


  final Function(String id) togglefavoriteMeal;
  final Function(String id) isMealfavoriteMeal;
   MealDetail({Key? key,required this.togglefavoriteMeal,required this.isMealfavoriteMeal}) : super(key: key);

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  buildSliverAppBar(String id,String title,String imga){
    return SliverAppBar(

     elevation: 10,
      floating: true,
      expandedHeight: 500,

      pinned: true,
      stretch: false,

       automaticallyImplyLeading: false,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title:Padding(
          padding: EdgeInsets.symmetric(horizontal:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children:  [
              ModrenButton(
                icon: Icons.arrow_back_ios_new_rounded,
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
              ModrenButton(
                icon: Icons.favorite,
              ),
            ],
          ),
        ),
        background: Hero(

          tag:id ,


            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight:Radius.circular(15) ,
                bottomLeft: Radius.circular(15)
              ),
              child:  Container(

                decoration: BoxDecoration(

                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:NetworkImage(imga,)
                    )
                ),
              ),



          ) ,
        ),

      ),

    );


  }

  @override
  Widget build(BuildContext context) {
    final mealDetailAgr=ModalRoute.of(context)?.settings.arguments as String;

    final mealDetailList=DUMMY_MEALS.firstWhere((meal) =>
    mealDetailAgr==meal.id
    );
    String mealId=mealDetailList.id;

    return SafeArea(
      child: Scaffold(

          body:NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                buildSliverAppBar(mealDetailList.id, mealDetailList.title, mealDetailList.imageUrl),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                children: [

SizedBox(height: 20,),
                  Text("Ingraidient"),
                  Container(
                    height: 220,
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.black54
                      ),
                        color: Colors.grey.shade300
                    ),





                      child: ListView.builder(
                        physics:ScrollPhysics(),
                        itemCount: mealDetailList.ingredients.length,
                        itemBuilder: (context,index){
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              child: Text(
                                  mealDetailList.ingredients[index]
                              ),
                            ),
                          );
                        },
                      ),
                    ),


                  SizedBox(height: 20,),
                  Text("Ingraidient"),
                  Container(
                    height: 340,
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Colors.black54
                      ),
                    ),





                      child: ListView.builder(
                        itemCount: mealDetailList.steps.length,
                        itemBuilder: (context,index){
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 0),
                              child:ListTile(
                                title:  Text(
                                    mealDetailList.steps[index]
                                ),
                                leading: CircleAvatar(
                                  radius: 20,
                                  child: Text("# ${index+1}"),
                                ),
                              )
                            ),
                          );
                        },
                      ),
                    ),

                ],
              ),
            )),

            floatingActionButton: FloatingActionButton(
          onPressed: (){
            widget.togglefavoriteMeal(mealDetailAgr);
          setState((){
            widget.isMealfavoriteMeal(mealDetailAgr);
          });
          },
      child: Icon(widget.isMealfavoriteMeal(mealDetailAgr)?Icons.abc:Icons.favorite_outline),


      ),

        //CustomScrollView(
 //           slivers: [
 //
 //              buildSliverAppBar(mealDetailList.id,mealDetailList.title,mealDetailList.imageUrl),
 //
 //          SliverList(
 //            delegate: SliverChildBuilderDelegate(
 //                    (context, index) =>
 //            Card(
 //              color: MyColor.ContainerBackground,
 //              child: Padding(
 //                padding: EdgeInsets.symmetric(horizontal: 10),
 //                child: Text(
 //                  mealDetailList.ingredients[index],style: TextStyle(
 //                  color: Colors.white
 //                ),
 //                ),
 //              ),
 //            ),
 //              childCount: mealDetailList.ingredients.length
 //            ),
 //          ),
 //
 //        //Column(
 //        //
 //        //
 //        //   children: [
 //        //
 //        //     Container(
 //        //       padding: EdgeInsets.all(10),
 //        //       height: 300,
 //        //       width: double.infinity,
 //        //       child: FadeInImage.assetNetwork(
 //        //           placeholder: 'assets/images/leading.gif', image:mealDetailList.imageUrl),
 //        //     )
 //        //   ],
 //        // )
 //
 // ]
 //      )
      ),
    );
  }
}
class ModrenButton extends StatelessWidget {
  final IconData? icon;
  final Function? onTap;
  const ModrenButton({
    this.icon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [MyColor.ContainerBackground, MyColor.backgroundColor],
          ),
        ),
        child: Icon(
          icon,
          color: const Color.fromARGB(255, 129, 125, 125),
          size: 25,
        ),
      ),
    );
  }
}