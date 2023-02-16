part of 'review_bloc.dart';

@immutable
abstract class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

class ReviewsLoading extends ReviewsState {}

class ReviewsLoaded extends ReviewsState {
  final List<Review> reviews;

  const ReviewsLoaded({this.reviews = const <Review>[]});

  @override
  List<Object> get props => [reviews];
}

class IncrementPressed extends ReviewsState {
  final int voteCount;

  const IncrementPressed({required this.voteCount});
}

class DecrementPressed extends ReviewsState {
  final int voteCount;

  const DecrementPressed({required this.voteCount});
}
