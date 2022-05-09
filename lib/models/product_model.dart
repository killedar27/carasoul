import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.isPopular,
    required this.isRecommended,
    required this.price,
  });

  static Product fromSnapshot(DocumentSnapshot snap)
  {
    Product product=Product(name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      isPopular: snap['isPopular'],
      isRecommended: snap['isRecommended'],
      price: snap['price'],
    );
    return product;
  }

  @override
  List<Object?> get props => [
    name,
    category,
    imageUrl,
    price,
    isPopular,
    isRecommended
  ];

  static List<Product> product=[
    Product(
        name: 'Soft Drink #1',
        category: 'Soft Drink',
        imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.iGwIldjKja5_xH99Z0qp0wHaE8&pid=Api&P=0&w=260&h=174',
        isPopular: true,
        isRecommended: true,
        price: 1.99
    ),
    Product(
        name: 'Soft Drink #2',
        category: 'Soft Drink',
        imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.kDtIGMRZ7O6l7RpU46-81QHaFj&pid=Api&P=0&w=231&h=174',
        isPopular: true,
        isRecommended: true,
        price: 2.99
    ),
    Product(
        name: 'Soft Drink #3',
        category: 'Soft Drink',
        imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.XXO5a_C1YnfSD88VewYQaQHaG1&pid=Api&P=0&w=187&h=173',
        isPopular: true,
        isRecommended: true,
        price: 3.99
    ),
    Product(
        name: 'Smoothies #1',
        category: 'Smoothies',
        imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.12M47dO3kiGanlXtbLiCVAHaJv&pid=Api&P=0&w=300&h=300',
        isPopular: true,
        isRecommended: true,
        price: 2.99
    ),
    Product(
        name: 'Smoothies #2',
        category: 'Smoothies',
        imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.dLZgGPEBsScZQe7FjNk7fQHaHa&pid=Api&P=0&w=300&h=300',
        isPopular: true,
        isRecommended: true,
        price: 4.99
    ),
    Product(
        name: 'Smoothies #3',
        category: 'Smoothies',
        imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.xNlAyig4-Q433nmQQBxiowHaHa&pid=Api&P=0&w=300&h=300',
        isPopular: true,
        isRecommended: true,
        price: 7.99
    ),
    Product(
        name: 'Water #1',
        category: 'Water',
        imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.eJtSE2O0mb9jtL68At79jgHaJm&pid=Api&P=0&w=300&h=300',
        isPopular: true,
        isRecommended: true,
        price: 4.99
    ),
    Product(
        name: 'Water #2',
        category: 'Water',
        imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.K0H_Z9UW4AJuaaea7jMIvgHaEN&pid=Api&P=0&w=313&h=179',
        isPopular: true,
        isRecommended: true,
        price: 5.99
    ),
    Product(
        name: 'Water #3',
        category: 'Water',
        imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.OW55dHxzom6PNvlSjfTNrQHaHa&pid=Api&P=0&w=300&h=300',
        isPopular: true,
        isRecommended: true,
        price: 6.99
    ),
  ];
}