import 'package:flutter/material.dart';
import 'package:minimal_eccomerce_app/components/my_button.dart';
import 'package:minimal_eccomerce_app/model/product.dart';
import 'package:minimal_eccomerce_app/model/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  //remove item from cart Method
  void removeItemFromCart(BuildContext context, Product product){

    showDialog(
      context: context, 
    builder: (context) => AlertDialog(
      content: Text("Remove this item from your cart"),
      actions: [
        //cancel button
        MaterialButton(
          onPressed: () =>Navigator.pop(context),
          child: Text("Cancel"),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
            context.read<Shop>().addToCart(product);
            },
           child: Text("Yes"),
            ),

      ],
    ),
    );
  }
  void payButtonPressed(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: Text("User Wants to pay ! connect this app to your payment backend"),
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    // get acces to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
     appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 1,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("Cart Page"),
     ), 
     drawer: Drawer(),
     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
     body:  Column(
      children: [
        Expanded(
          child: cart.isEmpty? Center(child: Text("Your cart is empty"))
        :ListView.builder(
          itemCount: cart.length,
          itemBuilder: (BuildContext context, int index) {
            //get individual item in cart
            final item = cart[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.price.toStringAsFixed(2),
            
            ),
            trailing: IconButton(
              onPressed: () => removeItemFromCart(context, item), 
              icon: Icon(Icons.remove)),
          );
         },
        ),
        ),
        Padding(
          padding: const EdgeInsets.only(
          left: 50, right:  50, bottom: 20),
          child: MyButton(
            ontap: () => payButtonPressed(context), 
            color: Colors.amberAccent, 
            child: Text("Pay Now")),
        )
      ],
     ),
    );
  }
}