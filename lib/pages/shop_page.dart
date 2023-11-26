import 'package:flutter/material.dart';
import 'package:minimal_eccomerce_app/model/shop.dart';
import 'package:provider/provider.dart';
import 'package:minimal_eccomerce_app/components/my_drawer.dart';
import 'package:minimal_eccomerce_app/components/my_product_tile.dart';


class ShopPage extends StatelessWidget {
  ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the 'products' inside the build method using context
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Shop Page"),
        actions: [
          // go to cart button
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 550,
          child: ListView.builder(
            itemCount: products.length,
            padding: EdgeInsets.all(15),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              // get each individual product from shop
              final product = products[index];
              // return as a product tile UI
              return MyProductTile(product: product);
            },
          ),
        ),
      ),
    );
  }
}
