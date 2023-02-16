import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class SortedHeadline extends StatelessWidget {
  final String title;
  const SortedHeadline({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ));
  }
}
