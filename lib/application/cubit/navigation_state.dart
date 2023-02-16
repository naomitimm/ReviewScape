part of 'navigation_cubit.dart';

@immutable
abstract class NavigationState extends Equatable {
  get user => null;
}

class NavigationInitial extends NavigationState {
  @override
  List<Object?> get props => [];
}

class LandingRoute extends NavigationState {
  @override
  List<Object?> get props => [];
}

class LoginRoute extends NavigationState {
  @override
  List<Object?> get props => [];
}

class SignupRoute extends NavigationState {
  @override
  List<Object?> get props => [];
}

class DashboardRoute extends NavigationState {
  final int tabIndex;
  @override
  final User user;
  DashboardRoute({required this.tabIndex, required this.user});
  @override
  List<Object?> get props => [tabIndex, user];
}

class ProductDetailsRoute extends NavigationState {
  final Product product;
  @override
  final User user;
  ProductDetailsRoute({required this.product, required this.user});

  @override
  List<Object?> get props => [product, user];
}

class SortedProductRoute extends NavigationState {
  @override
  final User user;
  final ProductType productType;
  SortedProductRoute({required this.productType, required this.user});

  @override
  List<Object?> get props => [productType, user];
}

class ReviewsRoute extends NavigationState {
  final Product product;
  @override
  final User user;
  ReviewsRoute({required this.product, required this.user});
  @override
  List<Object?> get props => [product, user];
}

class AddReviewRoute extends NavigationState {
  final Review review;
  final Product product;
  @override
  final User user;
  AddReviewRoute(
      {required this.review, required this.product, required this.user});

  @override
  List<Object?> get props => [review, product];
}

class CommentRoute extends NavigationState {
  final Review review;
  final Product product;
  @override
  final User user;
  CommentRoute(
      {required this.review, required this.product, required this.user});

  @override
  List<Object?> get props => [review];
}
