
import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/widgets/cart_product_card.dart';
import 'package:e_commerce/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName='/';
  static Route route(){
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_)=>CartScreen(),

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                onPressed: (){},
                child: Text('Go To Checkout',
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),

                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc,CartState>(
        builder: (context,state) {
          if(state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is CartLoaded){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/');
                            },
                            child: Text('Add More Items',style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(),
                              elevation: 0,
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 13,),

                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                            itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                            itemBuilder: (context,index){
                              return CartProductCard (
                                  product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                                  quantity: state.cart.productQuantity(state.cart.products).values.elementAt(index),
                              );}
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [

                      Divider(thickness: 2,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('SUBTOTAL',style: Theme.of(context).textTheme.headline6,),
                                Text('\$${state.cart.subtotalString}',style: Theme.of(context).textTheme.headline6),
                              ],),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Delivery Fee',style: Theme.of(context).textTheme.headline6,),
                                Text('\$${state.cart.deliveryFeeString}',style: Theme.of(context).textTheme.headline6),
                              ],),

                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
                          ),
                          Container(width: MediaQuery.of(context).size.width,
                            height: 50,
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(color: Colors.black),
                            child:
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total',style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),),
                                  Text('\$${state.cart.totalString}',style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white)),
                                ],),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }else{
            return Text('Something went Wrong');
          }
        },
      )
    );
  }
}