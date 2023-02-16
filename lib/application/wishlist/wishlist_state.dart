part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState extends Equatable {}

class WishlistInitial extends WishlistState {
  @override
  List<Object?> get props => [];
}

class WishlistLoading extends WishlistState {
  @override
  List<Object?> get props => [];
}

class WishlistLoadingSuccessful extends WishlistState {
  final List<Product> products;
  WishlistLoadingSuccessful({this.products = const <Product>[]});
  @override
  List<Object?> get props => [products];
}

class WishlistLoadingFailed extends WishlistState {
  final Exception error;
  WishlistLoadingFailed({required this.error});
  @override
  List<Object?> get props => [error];
}

class AddedToWhishlist extends WishlistState {
  @override
  List<Object?> get props => [];
}

class RemovedFromWishlist extends WishlistState {
  @override
  List<Object?> get props => [];
}
