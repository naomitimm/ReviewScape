import 'dart:math';

import 'package:ethio_agri_ceft_app/application/commentbloc/comments_bloc.dart';
import 'package:ethio_agri_ceft_app/domain/comment/comment_model.dart';
import 'package:ethio_agri_ceft_app/domain/user/user_model.dart';
import 'package:ethio_agri_ceft_app/presentation/dashboard/widgets/comment_widget.dart';
import 'package:ethio_agri_ceft_app/presentation/dashboard/widgets/details_widgets.dart';
import 'package:ethio_agri_ceft_app/presentation/dashboard/widgets/review_widgets.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

import '../../../domain/review/review_model.dart';

class CommentScreen extends StatefulWidget {
  final Review review;
  final Product product;
  final User user;
  const CommentScreen(
      {super.key,
      required this.review,
      required this.product,
      required this.user});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late User newUser;
  @override
  void initState() {
    newUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerComment = TextEditingController();
    final navCubit = context.read<NavigationCubit>();
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {
        if (state is CommentsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CommentsLoaded) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: size.height / 10,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(42, 44, 65, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BackBtnEmbedded(dispatcher: () {
                            navCubit.toReviewsScreen(
                                widget.product, widget.user);
                          }),
                          SizedBox(
                            width: size.width / 4,
                          ),
                          Text(widget.review.reviewer_handle,
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                    ),
                  ),
                  ReviewCard(
                    reviews: widget.review,
                    product: widget.product,
                    user: widget.user,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: controllerComment,
                        keyboardType: TextInputType.multiline,
                        maxLines: 20,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () {
                                var comment = Comment(
                                    content: controllerComment.value.text,
                                    id: Random().nextInt(200));
                                context
                                    .read<CommentsBloc>()
                                    .add(AddComment(comment: comment));
                              },
                            ),
                            hintText: "Write your comment",
                            focusColor: const Color.fromRGBO(42, 44, 65, 1),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(42, 44, 65, 1)))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.comments.length,
                      itemBuilder: (BuildContext context, int index) =>
                          CommentCard(
                        comment: state.comments[index],
                        user: newUser,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return const Text("Something Went Wrong");
        }
      },
    );
  }
}
