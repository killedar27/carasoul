import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({Key? key,required this.product,required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(product.imageUrl,width: 100,height: 80,fit: BoxFit.cover,),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              children: [
                Text(product.name,style:  Theme.of(context).textTheme.headline5,),
                Text('\$${product.price}',style:  Theme.of(context).textTheme.headline6),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          SizedBox(width: 10,),
          BlocBuilder<CartBloc,CartState>(
            builder:(context,state){
              if(state is CartLoading){
                return CircularProgressIndicator();
              }
              if(state is CartLoaded) {
                return Row(
                  children: [
                    IconButton(onPressed: () {
                      context.read<CartBloc>().add(CartProductRemoved(product));
                    }, icon: Icon(Icons.remove_circle)),
                    Text('$quantity', style: Theme
                        .of(context)
                        .textTheme
                        .headline5),
                    IconButton(onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(product));
                    }, icon: Icon(Icons.add_circle)),
                  ],
                );
              }else{
                return Text('Something went wrong!');
              }
            }

          )
        ],
      ),
    );
  }
}