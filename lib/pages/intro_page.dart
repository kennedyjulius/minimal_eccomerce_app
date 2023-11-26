import 'package:flutter/material.dart';
import 'package:minimal_eccomerce_app/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //logo
              Icon(
                Icons.shopping_bag,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 72,
                ),
                SizedBox(height: 25,),
              //title
              Text("Minimal Shop,",
               style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 20),),
                SizedBox(height: 15,),
              // subtitle
              Text("Premium Quality Products,",
               style: TextStyle(
                fontWeight: FontWeight.normal, 
                fontSize: 16),),
                SizedBox(height: 25,),
        
              //button
              MyButton(ontap: () => Navigator.pushNamed(context, '/shop_page'),  
              color: Theme.of(context).colorScheme.secondary,
               child: Icon(Icons.arrow_forward_ios_outlined))
            ],
          ),
        ),
      ),
    );
  }
}