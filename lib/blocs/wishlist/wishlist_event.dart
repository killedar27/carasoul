part of 'wishlist_bloc.dart';

abstract class WishListEvent extends Equatable{
  const WishListEvent();

  @override
  List<Object>get props=>[];
}

class StartWishlist extends WishListEvent{}

class AddWishlistProduct extends WishListEvent{
  final Product product;
  const AddWishlistProduct(this.product);

  @override
  List<Object>get props=>[product];
}

class RemoveWishlistProduct extends WishListEvent{
  final Product product;
  const RemoveWishlistProduct(this.product);

  @override
  List<Object>get props=>[product];
}