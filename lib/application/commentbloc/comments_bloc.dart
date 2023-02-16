import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ethio_agri_ceft_app/domain/comment/comment_model.dart';
import 'package:meta/meta.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(CommentsLoading()) {
    on<LoadComments>(_onLoadComments);
    on<AddComment>(_onAddComment);
  }

  _onLoadComments(LoadComments event, Emitter<CommentsState> emit) {
    emit(CommentsLoaded(comments: event.comments));
  }

  _onAddComment(AddComment event, Emitter<CommentsState> emit) {
    final state = this.state;
    if (state is CommentsLoaded) {
      emit(CommentsLoaded(
          comments: List.from(state.comments)..add(event.comment)));
    }
  }
}
