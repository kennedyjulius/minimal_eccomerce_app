import 'package:flutter/material.dart';
import 'package:minimal_eccomerce_app/components/my_listtile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: 
      Theme.of(context).colorScheme.inversePrimary,
      child: Column(
        children: [
          DrawerHeader(child: 
          Icon(Icons.shopping_bag,
          size: 72,
          color: Theme.of(context).colorScheme.inversePrimary,
          ),
          ),
          SizedBox(height: 25,),

          // shop Tile
          Column(
            children: [
              MyListTile(icon: Icons.home,
               text: "Shop", 
               ontap: () => Navigator.pop(context),
               ),

               MyListTile(icon: Icons.shopping_cart,
               text: "Cart", 
               ontap: () {
                 Navigator.pop(context);
                 Navigator.pushNamed(context, '/cart_page');
               },
               ),
            ],
          ),

           Padding(
             padding: const EdgeInsets.only(bottom: 30),
             child: MyListTile(icon: Icons.logout,
             text: "Exit", 
             ontap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false,
              );
               
             },
             ),
           )
        ],
      ),
    );
  }
}