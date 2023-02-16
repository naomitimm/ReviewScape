import 'package:equatable/equatable.dart';
import 'package:ethio_agri_ceft_app/domain/comment/comment_model.dart';

class Review extends Equatable {
  final String content;
  final int id;
  final List<Comment>? review_comments;
  final int upvote_count;
  final int downvote_count;
  final String reviewer_handle;

  const Review(
      {required this.content,
      required this.id,
      this.review_comments,
      required this.upvote_count,
      required this.downvote_count,
      required this.reviewer_handle});
  @override
  List<Object?> get props => [
        review_comments,
        content,
        id,
        upvote_count,
        downvote_count,
        reviewer_handle
      ];

  static List<Review> reviews = [
    Review(
        content:
            " Fusce ultrices volutpat lacus, pharetra commodo arcu consectetur id.Integer congue venenatis vestibulum. Nam eget eros ,",
        id: 1,
        review_comments: Comment.comments,
        upvote_count: 5,
        downvote_count: 11,
        reviewer_handle: "@John Doe"),
    Review(
        content:
            "amet, consectetur adipiscing elit. Fusce ultrices volutpat lacus, pharetra commodo arcu consectetur id. Vestibulum  ,",
        id: 2,
        review_comments: Comment.comments,
        upvote_count: 4,
        downvote_count: 7,
        reviewer_handle: "@Joe Rogan"),
    Review(
        content:
            "ipsum dolor sit amet, consectetur adipiscing elit. . Integer congue venenatis vestibulum. Nam eget eros ,",
        id: 3,
        review_comments: Comment.comments,
        upvote_count: 10,
        downvote_count: 3,
        reviewer_handle: "@Hugo First"),
  ];
}
