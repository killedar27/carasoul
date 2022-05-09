import 'package:e_commerce/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable{
  final List<Product> products;

  const Cart({this.products=const<Product>[]});


  double get subtotal =>products.fold(0, (total, current) => total+current.price);


  String get subtotalString => subtotal.toStringAsFixed(2);


  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);


  String get freeDeliveryString => freeDelivery(subtotal);


  String get totalString=> total(subtotal, deliveryFee).toStringAsFixed(2);

  double total(subtotal,deliveryFee){
    return subtotal+deliveryFee(subtotal);
  }


  Map productQuantity(products){
    var quantity=Map();

    products.forEach((product){
      if(!quantity.containsKey(product)){
        quantity[product]=1;
      }else{
        quantity[product]+=1;
      }
    });
    return quantity;
  }

  String freeDelivery(subtotal){
    if(subtotal>=30.0){
      return 'You have\n Free Delivery';
    }else{
      double missing=30.0-subtotal;

      return 'Add \$${missing.toStringAsFixed(2)}\n for FREE Delivery';
    }
  }


  @override
  List<Object?> get props =>[products];


  double deliveryFee(subtotal){
    if(subtotal>=30.0)
      return 0.0;
    else return 10.0;
  }

}