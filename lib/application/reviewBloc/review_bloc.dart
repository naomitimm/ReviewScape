// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ethio_agri_ceft_app/domain/review/review_model.dart';

import 'package:meta/meta.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc() : super(ReviewsLoading()) {
    on<LoadReviews>(_onLoadReviews);
    on<AddReview>(_onAddReview);
    on<UpdateReview>(_onUpdateReview);
    on<DeleteReview>(_onDeleteReview);
    on<IncrementVote>(_onUpvote);
    on<DecrementVote>(_onDownvote);
  }

  void _onLoadReviews(LoadReviews event, Emitter<ReviewsState> emit) {
    emit(ReviewsLoaded(reviews: event.reviews));
  }

  void _onAddReview(AddReview event, Emitter<ReviewsState> emit) {
    final state = this.state;
    if (state is ReviewsLoaded) {
      emit(ReviewsLoaded(reviews: List.from(state.reviews)..add(event.review)));
    }
  }

  void _onUpdateReview(UpdateReview event, Emitter<ReviewsState> emit) {}

  void _onDeleteReview(DeleteReview event, Emitter<ReviewsState> emit) {
    final state = this.state;
    if (state is ReviewsLoaded) {
      List<Review> reviews = state.reviews.where((review) {
        return review.id != event.review.id;
      }).toList();
      emit(ReviewsLoaded(reviews: reviews));
    }
  }

  void _onUpvote(IncrementVote event, Emitter<ReviewsState> emit) {
    final state = this.state;

    if (state is IncrementPressed) {
      emit(IncrementPressed(voteCount: event.voteCount + 1));
    }
  }

  void _onDownvote(DecrementVote event, Emitter<ReviewsState> emit) {
    final state = this.state;
    if (state is DecrementPressed) {
      emit(DecrementPressed(voteCount: event.voteCount - 1));
    }
  }
}
