import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavigationCubit>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 248, 1),
      body: ListView(
        children: [
          const LandingPageWave(),
          Padding(
            padding: EdgeInsets.only(top: size.height / 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // LandingBtn(
                //   text: "New Account",
                //   textColor: Colors.white,
                //   btnColor: const Color.fromRGBO(255, 114, 76, 1),
                //   dispatcher: () {
                //     navCubit.toSignupScreen();
                //   },
                // ),
                LandingBtn(
                  text: "New Account",
                  textColor: Colors.white,
                  btnColor: const Color.fromRGBO(42, 44, 65, 1),
                  dispatcher: () {
                    navCubit.toSignupScreen();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                LinkText(
                    color: const Color.fromRGBO(42, 44, 65, 1),
                    text: "Login",
                    navigator: () {
                      navCubit.toLoginScreen();
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
