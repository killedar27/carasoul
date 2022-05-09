import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;
  const ProductCard({Key? key, required this.product,this.widthFactor=2.5,this.leftPosition=5.0,this.isWishlist=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue=MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context,
            '/product',
            arguments: product,
        );
      },
      child: Stack(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor,
              height: 150,
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
          ),
          // Positioned(
          // top: 60,
          //child: Container(
          // width: MediaQuery.of(context).size.width / 2.5,
          //height: 80,
          //decoration: BoxDecoration(
          // color: Colors.black.withAlpha(100),
          //),
          //),
          //),
          Positioned(
            top: 55,
            left: leftPosition+5,
            child: Container(
              width: widthValue-15-leftPosition,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.transparent.withAlpha(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          Text(
                            '\$${product.price}',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc,CartState>(
                      builder: (context,state){
                        if(state is CartLoading){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if(state is CartLoaded){
                          return Expanded(
                            child: IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.white,

                              ),
                              onPressed: () {
                                context.read<CartBloc>().add(CartProductAdded(product));

                                final snackBar=SnackBar(content: Text('Added to your Cart!'));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                },
                            ),
                          );
                        }else{
                          return Text('Something went Wrong');
                        }
                      },

                    ),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                              icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                                ),
                              onPressed: () {},
                      ),
                    ):SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
