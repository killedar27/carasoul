import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable{
    final String name;
    final String imageUrl;
   const Category({
      required this.name,
      required this.imageUrl,
   });

  @override
  List<Object?> get props => [name,imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap)
  {
    Category category = Category(name: snap['name'], imageUrl: snap['imageUrl'],);
    return category;
  }

   static List<Category> category=[
     Category(
         name: 'Soft Drink',
         imageUrl:'https://tse3.mm.bing.net/th?id=OIP.u5ZNB83osBp-23AWJ_sKTAHaE7&pid=Api&P=0&w=250&h=167'
     ),
     Category(
         name: 'Smoothies',
         imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg9QjykdEfAx-HXXyPTsHZqwnQzIIX1JhFCw&usqp=CAU'
     ),
     Category(
         name: 'Water',
         imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2zrWKjX7hdjmMize4zfddvcCg4h5evGV_Jw&usqp=CAU'
     ),
   ];
}