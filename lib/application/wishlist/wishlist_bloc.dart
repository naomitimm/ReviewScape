// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ethio_agri_ceft_app/domain/product/product_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadWishlist>(_handleLoadWishlist);
    on<AddToWishlist>(_handleAddToWishlist);
    on<RemoveFromWishlist>(_handleRemoveFromWishlist);
  }

  _handleLoadWishlist(LoadWishlist event, Emitter emit) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(WishlistLoadingSuccessful(products: event.products));
    } on Exception catch (error) {
      emit(WishlistLoadingFailed(error: error));
    }
  }

  _handleAddToWishlist(AddToWishlist event, Emitter emit) {
    final state = this.state;
    if (state is WishlistLoadingSuccessful) {
      emit(WishlistLoadingSuccessful(
          products: List<Product>.from(state.products)..add(event.product)));
    }
  }

  _handleRemoveFromWishlist(RemoveFromWishlist event, Emitter emit) {
    final state = this.state;
    if (state is WishlistLoadingSuccessful) {
      final List<Product> products = state.products.where((product) {
        return product.productName != event.product.productName;
      }).toList();
      emit(WishlistLoadingSuccessful(products: products));
    }
  }
}
