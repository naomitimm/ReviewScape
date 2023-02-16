part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent extends Equatable {}

class LoadWishlist extends WishlistEvent {
  final List<Product> products;

  LoadWishlist({this.products = const <Product>[]});
  @override
  List<Object?> get props => [];
}

class AddToWishlist extends WishlistEvent {
  final Product product;
  AddToWishlist({required this.product});
  @override
  List<Object?> get props => [Product];
}

class RemoveFromWishlist extends WishlistEvent {
  final Product product;
  RemoveFromWishlist({required this.product});
  @override
  List<Object?> get props => [product];
}
