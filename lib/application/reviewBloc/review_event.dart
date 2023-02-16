part of 'review_bloc.dart';

@immutable
abstract class ReviewsEvent extends Equatable {
  const ReviewsEvent();

  @override
  List<Object> get props => [];
}

class LoadReviews extends ReviewsEvent {
  final List<Review> reviews;

  const LoadReviews({this.reviews = const <Review>[]});

  @override
  List<Object> get props => [reviews];
}

class AddReview extends ReviewsEvent {
  final Review review;

  const AddReview({required this.review});

  @override
  List<Object> get props => [review];
}

class UpdateReview extends ReviewsEvent {
  final List<Review> review;

  const UpdateReview({required this.review});

  @override
  List<Object> get props => [review];
}

class DeleteReview extends ReviewsEvent {
  final Review review;

  const DeleteReview({required this.review});

  @override
  List<Object> get props => [review];
}

class IncrementVote extends ReviewsEvent {
  final int voteCount;

  const IncrementVote({required this.voteCount});
}

class DecrementVote extends ReviewsEvent {
  final int voteCount;

  const DecrementVote({required this.voteCount});
}
