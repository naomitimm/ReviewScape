part of 'comments_bloc.dart';

@immutable
abstract class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

class CommentsLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<Comment> comments;

  const CommentsLoaded({this.comments = const <Comment>[]});

  @override
  List<Object> get props => [comments];
}
