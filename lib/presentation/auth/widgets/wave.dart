import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class LandingPageWave extends StatelessWidget {
  const LandingPageWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipPath(
          clipper: LandingClipper(),
          child: Stack(
            children: [
              Container(
                color: const Color.fromRGBO(255, 114, 76, 1),
                height: size.height / 1.5,
                width: double.infinity,
              ),
              const Positioned.fill(
                  child: Align(
                      alignment: Alignment.center,
                      child: AppHeadline(color: Colors.white))),
            ],
          ),
        ),
      ],
    );
  }
}

class LandingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;

    path.lineTo(0, height - 70);

    var firstControlling = Offset(width / 3, height + 70);

    var firstEnd = Offset(width / 1.4, height - 100.0);

    path.quadraticBezierTo(
        firstControlling.dx, firstControlling.dy, firstEnd.dx, firstEnd.dy);

    var secondControlling = Offset(width - (width / 8.24), height - 165);

    var secondEnd = Offset(width, height - 110);
    path.quadraticBezierTo(
        secondControlling.dx, secondControlling.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
