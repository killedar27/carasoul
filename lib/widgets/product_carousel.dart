
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';


class ProductCarousel extends StatelessWidget {
  final List<Product> product;
  const ProductCarousel({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: product.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: ProductCard(product: product[index]),
            );
          }),
    );
  }
}
