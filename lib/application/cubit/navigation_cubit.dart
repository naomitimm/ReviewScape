// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ethio_agri_ceft_app/domain/product/product_model.dart';
import 'package:ethio_agri_ceft_app/domain/product/product_type_model.dart';
import 'package:ethio_agri_ceft_app/domain/review/review_model.dart';
import 'package:ethio_agri_ceft_app/domain/user/user_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
  void toLandingScreen() => emit(LandingRoute());
  void toLoginScreen() => emit(LoginRoute());
  void toSignupScreen() => emit(SignupRoute());
  void toDashboardScreen(
    User user, [
    int tabIndex = 0,
  ]) =>
      emit(DashboardRoute(tabIndex: tabIndex, user: user));
  void toProductDetailsScreen(Product product, User user) =>
      emit(ProductDetailsRoute(product: product, user: user));

  void toSortedProductsScreen(ProductType productType, User user) =>
      emit(SortedProductRoute(productType: productType, user: user));
  void toReviewsScreen(Product product, User user) =>
      emit(ReviewsRoute(product: product, user: user));

  void toAddReviewScreen(Review review, Product product, User user) =>
      emit(AddReviewRoute(review: review, product: product, user: user));
  void toCommentScreen(Review review, Product product, User user) =>
      emit(CommentRoute(review: review, product: product, user: user));
}
