import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final String content;
  final int id;
  const Comment({required this.content, required this.id});
  @override
  List<Object?> get props => [content, id];

  static List<Comment> comments = [
    const Comment(
        content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultrices volutpat lacus, pharetra commodo arcu ",
        id: 1),
    const Comment(
        content:
            "quis eget velit. Etiam facilisis nec turpis quis feugiat. Phasellus efficitur augue turpis,",
        id: 2),
    const Comment(
        content:
            "accumsan dolor ut erat accumsan, sed aliquet nulla fringilla. Integer eu neque eget mauris rhoncus dictum. Maecenas ,",
        id: 3)
  ];
}
