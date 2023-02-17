import 'package:ethio_agri_ceft_app/application/commentbloc/comments_bloc.dart';
import 'package:ethio_agri_ceft_app/application/reviewBloc/review_bloc.dart';
import 'package:ethio_agri_ceft_app/presentation/dashboard/extras/comment_screen.dart';
import 'package:ethio_agri_ceft_app/presentation/dashboard/extras/reviews_screen.dart';
import 'package:ethio_agri_ceft_app/presentation/dashboard/extras/sorted_products_screen.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

import 'domain/comment/comment_model.dart';
import 'domain/review/review_model.dart';

void main() {
  runApp(const ReviewScape());
}

class ReviewScape extends StatelessWidget {
  const ReviewScape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => SignupBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => WishlistBloc()..add(LoadWishlist()),
        ),
        BlocProvider(
          create: ((context) => ReviewsBloc()
            ..add(LoadReviews(reviews: [
              Review(
                  content:
                      " Fusce ultrices volutpat lacus, pharetra commodo arcu consectetur id.Integer congue venenatis vestibulum. Nam eget eros ,",
                  id: 1,
                  review_comments: Comment.comments,
                  upvote_count: 5,
                  downvote_count: 11,
                  reviewer_handle: "@tony Doe"),
            ]))),
        ),
        BlocProvider(
          create: (context) => CommentsBloc()
            ..add(const LoadComments(comments: [
              Comment(
                  content:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultrices volutpat lacus, pharetra commodo arcu ",
                  id: 1),
              Comment(
                  content:
                      "quis eget velit. Etiam facilisis nec turpis quis feugiat. Phasellus efficitur augue turpis,",
                  id: 2),
            ])),
        ),
      ],
      child: const ReviewScapePages(),
    );
  }
}

class ReviewScapePages extends StatelessWidget {
  const ReviewScapePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Navigator(
            pages: [
              // const MaterialPage(child: LandingScreen()),
              const MaterialPage(
                  child: DashboardScreen(
                user: User(email: "", fullName: "", userName: ""),
              )),
              if (state is SignupRoute) MaterialPage(child: SignupScreen()),
              if (state is LoginRoute) const MaterialPage(child: LoginScreen()),
              if (state is LandingRoute)
                const MaterialPage(child: LandingScreen()),
              if (state is DashboardRoute)
                MaterialPage(
                    child: DashboardScreen(
                  user: state.user,
                )),
              if (state is ProductDetailsRoute)
                MaterialPage(
                    child: ProductDetailsScreen(
                  product: state.product,
                  user: state.user,
                )),
              if (state is SortedProductRoute)
                MaterialPage(
                    child: SortedProductsScreen(
                  productType: state.productType,
                  user: state.user,
                )),
              if (state is ReviewsRoute)
                MaterialPage(
                    child: ReviewsScreen(
                  product: state.product,
                  user: state.user,
                )),
              if (state is CommentRoute)
                MaterialPage(
                    child: CommentScreen(
                  review: state.review,
                  product: state.product,
                  user: state.user,
                ))
            ],
            onPopPage: (route, result) => route.didPop(result),
          ),
        );
      },
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(error.toString()),
      )),
    );
  }
}
