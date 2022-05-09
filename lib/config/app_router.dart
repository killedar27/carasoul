import 'package:e_commerce/models/models.dart';
import 'package:e_commerce/screens/catalog/catalog_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/product/product_screen.dart';
import 'package:e_commerce/screens/screens.dart';
import 'package:e_commerce/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){
    print('This is route: ${settings.name}');
    switch(settings.name){
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case '/cart':
        return CartScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case '/wishlist':
        return WishlistScreen.route();
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case '/product':
        return ProductScreen.route(product: settings.arguments as Product);
      case ProductScreen.routeName:
        return ProductScreen.route(product:  settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case '/catalog':
        return CatalogScreen.route(category:  settings.arguments as Category);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return  MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_)=>Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
      ),

    );
  }
}