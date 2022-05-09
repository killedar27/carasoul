import 'package:e_commerce/models/product_model.dart';

abstract class BaseProductRepository{
  Stream<List<Product>> getAllProducts();
}