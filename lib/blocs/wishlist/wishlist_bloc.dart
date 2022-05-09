import 'dart:async';
import 'package:e_commerce/models/models.dart';
import 'package:e_commerce/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishListEvent,WishlistState>{
    WishlistBloc():super(WishlistLoading());

    @override
    Stream<WishlistState> mapEventToState(
        WishListEvent event,
        )async*{
        if(event is StartWishlist){
            yield* _mapStartWishlistToState();
        }else if(event is AddWishlistProduct){
            yield* _mapAddWishlistProductToState(event,state);
        }else if(event is RemoveWishlistProduct){
            yield* _mapRemoveWishlistProductToState(event,state);
        }
    }

    Stream<WishlistState> _mapStartWishlistToState() async*{
        yield WishlistLoading();
        try{
            await Future<void>.delayed(Duration(seconds: 1));
            yield const WishlistLoaded();
        }catch(_){}
    }
    Stream<WishlistState> _mapAddWishlistProductToState(
        AddWishlistProduct event,
        WishlistState state,
        )async*{
        if(state is WishlistLoaded){
            try{
                yield WishlistLoaded(wishlist :Wishlist(products: List.from(state.wishlist.products)..add(event.product)));
            }catch(_){}
        }
    }

    Stream<WishlistState> _mapRemoveWishlistProductToState(
        RemoveWishlistProduct event,
        WishlistState state,
        )async*{
        if(state is WishlistLoaded){
            try{
                yield WishlistLoaded(wishlist :Wishlist(products: List.from(state.wishlist.products)..remove(event.product)));
            }catch(_){}
        }
    }

}