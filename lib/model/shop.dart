import 'package:flutter/material.dart';
import 'package:minimal_eccomerce_app/model/product.dart';

class Shop extends ChangeNotifier{
  //product for sale
  final List<Product> _shop = [
    //product 1
    Product(name: "Product1", 
    price: 99.99,
     description: "Item description...",
    imagePath: 'assets/glasses.jpeg'
  ),
  Product(name: "Product2", 
    price: 99.99,
     description: "Item description...",
    imagePath: 'assets/car.jpeg'
  ),
  Product(name: "Product3", 
    price: 99.99,
     description: "Item description...",
    imagePath: 'assets/laptop.jpeg'
  ),
  Product(name: "Product4", 
    price: 99.99,
     description: "Item description...",
    imagePath: 'assets/laptop.jpeg'
  ),
  ];
  //user cart
  List<Product> _cart = [];
  //get product list
  List<Product> get shop =>_shop;
  //get user cart
  List<Product> get cart => _cart;
  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromcart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}