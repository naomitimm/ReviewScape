import 'package:ethio_agri_ceft_app/domain/comment/comment_model.dart';
import 'package:ethio_agri_ceft_app/domain/user/user_model.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  final User user;
  const CommentCard({super.key, required this.comment, required this.user});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 15, 10),
        child: Container(
          height: size.height / 8,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: const Color.fromRGBO(42, 44, 65, 1), width: .1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        width: size.width / 18,
                        image:
                            const AssetImage('assets/orange_icons/user.png')),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(user.userName,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Color.fromRGBO(42, 44, 65, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    width: size.width / 1.2,
                    child: Text(comment.content,
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
          ),
        ));
  }
}
