part of 'comments_bloc.dart';

@immutable
abstract class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object> get props => [];
}

class LoadComments extends CommentsEvent {
  final List<Comment> comments;

  const LoadComments({this.comments = const <Comment>[]});

  @override
  List<Object> get props => [comments];
}

class AddComment extends CommentsEvent {
  final Comment comment;

  const AddComment({required this.comment});

  @override
  List<Object> get props => [comment];
}
