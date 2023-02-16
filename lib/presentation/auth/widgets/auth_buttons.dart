import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class LandingBtn extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color btnColor;
  final void Function() dispatcher;
  const LandingBtn({
    Key? key,
    required this.text,
    required this.textColor,
    required this.btnColor,
    required this.dispatcher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dispatcher,
      child: Container(
        height: 40,
        width: 190,
        decoration: BoxDecoration(
            color: btnColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthWideBlueButton extends StatelessWidget {
  final String lable;
  final void Function() dispatcher;
  final GlobalKey<FormState> formKey;
  const AuthWideBlueButton(
      {Key? key,
      required this.lable,
      required this.dispatcher,
      required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          dispatcher();
        }
      },
      child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromRGBO(42, 44, 65, 1),
              ),
              child: Center(
                child: Text(lable,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    )),
              ))),
    );
  }
}

class AuthLoadingButton extends StatelessWidget {
  const AuthLoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color.fromRGBO(42, 44, 65, 1),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(255, 114, 76, 1),
              ),
            )));
  }
}
