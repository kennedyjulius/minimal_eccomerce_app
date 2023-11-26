import 'package:flutter/material.dart';
import 'package:minimal_eccomerce_app/model/product.dart';
import 'package:minimal_eccomerce_app/model/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({Key? key, required this.product
  }) : super(key: key);
  void addToCart(BuildContext context) {
    showDialog(
      context: context, 
    builder: (context) => AlertDialog(
      content: Text("Add this item to your cart"),
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(25),
          width: 300,
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //product image
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Image.asset(product.imagePath)),
                //product name
                SizedBox(height: 14,),
    
                Text(product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: 
                  Theme.of(context).colorScheme.inversePrimary,
    
                ),
                ),
                SizedBox(height: 10,),
                //product description
                Text(product.description),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('\$'+product.price.toStringAsFixed(2)),
                    SizedBox(width: 20,),
                    //add cart Button
    
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber
                      ),
                      child: IconButton(onPressed: () => addToCart(context), 
                      icon: Icon(Icons.add))
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}