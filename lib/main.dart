import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:e_commerce/blocs/category/category_bloc.dart';
import 'package:e_commerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce/config/app_router.dart';
import 'package:e_commerce/repositories/category/category_repository.dart';
import 'package:e_commerce/repositories/product/product_repository.dart';
import 'package:e_commerce/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/product/product_bloc.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_)=>CartBloc()..add(CartStarted())),
        BlocProvider(create: (_) => CategoryBloc(categoryRepository: CategoryRepository(),)..add(LoadCategories()),),
        BlocProvider(create: (_) => ProductBloc(productRepository: ProductRepository(),)..add(LoadProducts()),),
      ],
      child: MaterialApp(
        title: 'Zero to Unicorn',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        home:  HomeScreen(),
      ),
    );
  }
}

