import 'dart:async';

import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/widgets/custom_appbar.dart';
import 'package:e_commerce/widgets/custom_navbar.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),

    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2),()=>Navigator.pushNamed(context, '/'));

    return Scaffold(
      body:Container(
        color: Colors.purple,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image(image: AssetImage('assets/images/ecomlogo.png'),width: 225,height: 150,),),
            SizedBox(height: 30,),
            Container(
              child: Text('E-Commerce',style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),),
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),)
          ],
        ),
      )
    );
  }
}