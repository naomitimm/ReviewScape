import 'package:ethio_agri_ceft_app/domain/review/review_model.dart';
import 'package:ethio_agri_ceft_app/domain/user/user_model.dart';
import 'package:ethio_agri_ceft_app/presentation/dashboard/widgets/details_widgets.dart';
import 'package:ethio_agri_ceft_app/presentation/dashboard/widgets/review_widgets.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

import '../../../application/reviewBloc/review_bloc.dart';
import 'dart:math';

class ReviewsScreen extends StatelessWidget {
  final Product product;
  final User user;
  const ReviewsScreen({super.key, required this.product, required this.user});

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavigationCubit>();
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, state) {
        if (state is ReviewsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ReviewsLoaded) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color.fromRGBO(244, 244, 248, 1),
              body: SafeArea(
                  child: ListView(
                children: [
                  Container(
                    height: size.height / 10,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(42, 44, 65, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackBtnEmbedded(dispatcher: () {
                            navCubit.toProductDetailsScreen(product, user);
                          }),
                          const ReviewHeadline(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.sort,
                                color: Colors.white,
                                size: 30,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 35,
                  ),
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.reviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ReviewCard(
                            reviews: state.reviews[index],
                            product: product,
                            user: user,
                          ),
                        ],
                      );
                    },
                  )),
                ],
              )),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: const Color.fromRGBO(42, 44, 65, 1),
                  onPressed: () {
                    // return openDialog();
                    showDialog(
                        context: context,
                        builder: (context) => AddReviewPopUp(
                              user: user,
                            ));
                    // navCubit.toAddReviewScreen(
                    //     Review.reviews[0], Product.products[0]);
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.solidCommentDots,
                    color: Colors.white,
                  )));
        } else {
          return const Center(child: Text("Something Went Wrong"));
        }
      },
    );
  }
}

class AddReviewPopUp extends StatelessWidget {
  final User user;
  const AddReviewPopUp({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerReview = TextEditingController();
    return BlocListener<ReviewsBloc, ReviewsState>(
      listener: (context, state) {
        if (state is ReviewsLoaded) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Review Added")));
        }
      },
      child: AlertDialog(
        title: const Center(child: Text("Add a Review")),
        content: SizedBox(
          height: 200,
          width: 200,
          child: TextFormField(
            controller: controllerReview,
            keyboardType: TextInputType.multiline,
            maxLines: 20,
            decoration: const InputDecoration(
                hintText: "Enter your review",
                focusColor: Color.fromRGBO(42, 44, 65, 1),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromRGBO(42, 44, 65, 1)))),
          ),
        ),
        actions: [
          Center(
            child: SizedBox(
              width: 150,
              height: 30,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(42, 44, 65, 1)),
                  ),
                  onPressed: () {
                    var review = Review(
                        content: controllerReview.value.text,
                        upvote_count: 0,
                        downvote_count: 0,
                        id: Random().nextInt(200),
                        reviewer_handle: user.userName);
                    context.read<ReviewsBloc>().add(AddReview(review: review));
                    Navigator.pop(context);
                  },
                  child: const Text("Add")),
            ),
          )
        ],
      ),
    );
  }
}
