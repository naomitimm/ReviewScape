import 'package:ethio_agri_ceft_app/domain/user/user_model.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

import '../../../domain/review/review_model.dart';

class ReviewHeadline extends StatelessWidget {
  const ReviewHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Reviews",
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ));
  }
}

class ReviewCard extends StatefulWidget {
  final Review reviews;
  final Product product;
  final User user;

  const ReviewCard(
      {super.key,
      required this.reviews,
      required this.product,
      required this.user});

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  int upVoteCount = 1;
  int downVoteCount = 1;
  String voteState = "";
  @override
  void initState() {
    upVoteCount = widget.reviews.upvote_count;
    downVoteCount = widget.reviews.downvote_count;
    super.initState();
  }

  void _upVote() {
    if (voteState == "upvote") {
      setState(() {
        upVoteCount--;
        voteState = "";
      });
    } else if (voteState == "downvote") {
      setState(() {
        upVoteCount++;
        downVoteCount--;
        voteState = "upvote";
      });
    } else {
      setState(() {
        upVoteCount++;
        voteState = "upvote";
      });
    }
  }

  void _downVote() {
    if (voteState == "downvote") {
      setState(() {
        downVoteCount--;
        voteState = "";
      });
    } else if (voteState == "upvote") {
      setState(() {
        upVoteCount--;
        downVoteCount++;
        voteState = "downvote";
      });
    } else {
      setState(() {
        downVoteCount++;
        voteState = "downvote";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final navCubit = context.read<NavigationCubit>();
    // int upVoteCount = widget.reviews.upvote_count;
    // int downVoteCount = widget.reviews.downvote_count;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        height: size.height / 5,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: const Color.fromRGBO(42, 44, 65, 1), width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(children: [
            SizedBox(
              height: size.height / 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                                width: size.width / 15,
                                image: const AssetImage(
                                    'assets/orange_icons/user.png')),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(widget.reviews.reviewer_handle,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: Color.fromRGBO(42, 44, 65, 1),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image(
                          width: size.width / 25,
                          image: const AssetImage(
                              'assets/orange_icons/left_quotes.png')),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SizedBox(
                          width: size.width / 1.2,
                          child: Text(widget.reviews.content,
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: size.height / 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconTextRow(
                              button: IconButton(
                                  onPressed: () {
                                    // context.read<ReviewsBloc>().add(
                                    //     IncrementVote(
                                    //         voteCount: upVoteCount));

                                    _upVote();
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.arrowUp,
                                    size: 20,
                                    color: voteState == "upvote"
                                        ? const Color.fromRGBO(255, 114, 76, 1)
                                        : const Color.fromRGBO(42, 44, 65, 1),
                                  )),
                              text: "$upVoteCount"),
                          const SizedBox(
                            width: 20,
                          ),
                          IconTextRow(
                              button: IconButton(
                                  onPressed: () {
                                    // context.read<ReviewsBloc>().add(
                                    //     DecrementVote(
                                    //         voteCount: downVoteCount));
                                    _downVote();
                                  },
                                  icon: FaIcon(FontAwesomeIcons.arrowDown,
                                      size: 20,
                                      color: voteState == "downvote"
                                          ? const Color.fromRGBO(
                                              255, 114, 76, 1)
                                          : const Color.fromRGBO(
                                              42, 44, 65, 1))),
                              text: "$downVoteCount"),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            navCubit.toCommentScreen(
                                widget.reviews, widget.product, widget.user);
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.comment,
                            size: 20,
                            color: Color.fromRGBO(42, 44, 65, 1),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class IconTextRow extends StatelessWidget {
  final IconButton button;
  final String text;
  const IconTextRow({super.key, required this.button, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        button,
        Text(text,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ))
      ],
    );
  }
}

class FloatingAddReview extends StatelessWidget {
  const FloatingAddReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
