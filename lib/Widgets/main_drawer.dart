import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/constant.dart';

import '../Screen/filtters_screen.dart';
import '../Screen/tabs_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        children: [

      //    DrawerHeader(
      //        child:Stack(
      //   children: [
      //
      //     Positioned(
      //
      //         child: Text(
      //           "Meal App",
      //           style: TextStyle(
      //             color: Colors.white,fontSize: 20
      //           ),
      //         ),
      //       bottom: 8.0,
      //       left: 4.0,
      //     )
      //   ],
      //
      // ),
      //      decoration: BoxDecoration(
      //
      //        color: Theme.of(context).primaryColor,
      //
      //        image: DecorationImage(
      //          image: AssetImage(
      //                 'assets/images/le.jpg'
      //          ),
      //          fit: BoxFit.cover
      //
      //
      //        )
      //      ),
      //
      //    ),

      UserAccountsDrawerHeader(
          accountName:Text("Ali"),
          accountEmail: Text("Fahmey@.com"),
      currentAccountPicture: CircleAvatar(
        radius: 20,
       backgroundColor: Colors.white,
       child: CircleAvatar(
         radius: 30,
         backgroundImage: AssetImage(
           'assets/images/le.jpg',

         ),
       ),
      ),

        decoration:

          BoxDecoration(

                   color: Theme.of(context).primaryColor,

                   image: DecorationImage(
                     image: AssetImage(
                            'assets/images/image.jpg'
                     ),
                     fit: BoxFit.cover


                   )
                 ),

      ),
          ListTile(
            leading: Icon(Icons.set_meal_outlined),
            title: Text("Meal"),
            onTap: (){
                   Navigator.of(context).pushReplacementNamed(TabsScreens.homeScreen);
            },
          ),
         ListTile(
           leading: Icon(Icons.filter_1_outlined),
           title: Text("Filter"),
           onTap: (){
            Navigator.of(context).pushReplacementNamed( Flitter_Screen.filtterScreens);
           },
         ),
          ListTile(
            leading:Icon( Icons.account_box),
            title: Text("About"),
          )


        ],



      ),

    );
  }
}
