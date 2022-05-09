
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:e_commerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce/widgets/custom_appbar.dart';
import 'package:e_commerce/widgets/hero_carousel_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName='/product';
  static Route route({required Product product}){
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context)=>ProductScreen(product: product),

    );
  }
  final Product product;
  const ProductScreen({required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: (){

                  },
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  )
              ),
              BlocBuilder<WishlistBloc,WishlistState>(
                builder: (context,state) {
                  return IconButton(
                      onPressed: () {
                        context.read<WishlistBloc>().add(AddWishlistProduct(product));
                        final snackBar=SnackBar(content: Text('Added to your Wishlist!'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      )
                  );
                }
              ),
              BlocBuilder<CartBloc,CartState>(
                builder: (context,state){
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: (){
                      context.read<CartBloc>().add(CartProductAdded(product));

                      Navigator.pushNamed(context, '/cart');
                    },
                    child: Text('Add To Cart',
                      style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),

                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
      body:
      ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
            ),
            items: [HeroCarouselCard(product: product,)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width-10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.name,
                        style: Theme.of(context).textTheme.headline5!.copyWith(color:Colors.white),
                        ),
                        Text('${product.price}',
                          style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text('Product Information',style: Theme.of(context).textTheme.headline4,),
              initiallyExpanded: true,
              children: [
                ListTile(
                  title: Text(' nsdunn fopvn gjf m,.wehuitowml n dfjkll a8irf[f kldf mbkl;t vhhiotw4 ngff',
                    style: Theme.of(context).textTheme.bodyText1,),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text('Delivery Information',style: Theme.of(context).textTheme.headline4,),

              children: [
                ListTile(
                  title: Text(' nsdunn fopvn gjf m,.wehuitowml n dfjkll a8irf[f kldf mbkl;t vhhiotw4 ngff',
                    style: Theme.of(context).textTheme.bodyText1,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}