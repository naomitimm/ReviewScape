import 'package:ethio_agri_ceft_app/domain/user/user_model.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final _userNameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavigationCubit>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 248, 1),
      body: Form(
        key: _formKey,
        child: ListView(children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  navCubit.toLandingScreen();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.angleLeft,
                  size: 25,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
              alignment: Alignment.topCenter,
              child: AppHeadline(
                color: Color.fromRGBO(255, 114, 76, 1),
              )),
          const SizedBox(
            height: 20,
          ),
          const Padding(
              padding: EdgeInsets.only(left: 40),
              child: GreyText(
                text: "Create your account",
              )),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                AuthTextField(
                    controller: _fullNameController,
                    hintText: "Full Name",
                    validator: UserFormValidator.validateFullName),
                const SizedBox(
                  height: 25,
                ),
                AuthTextField(
                    controller: _userNameController,
                    hintText: "User Name",
                    validator: UserFormValidator.validateUserName),
                const SizedBox(
                  height: 25,
                ),
                AuthTextField(
                    controller: _emailController,
                    hintText: "Email",
                    validator: UserFormValidator.validateEmail),
                const SizedBox(
                  height: 25,
                ),
                PasswordField(
                    controller: _passwordController,
                    hintText: "Password",
                    validator: UserFormValidator.validatePassword),
                const SizedBox(
                  height: 25,
                ),
                BlocConsumer<SignupBloc, SignupState>(
                  listener: (context, state) {
                    if (state is SignupSuccessful) {
                      navCubit.toDashboardScreen(User(
                          email: _emailController.text,
                          fullName: _fullNameController.text,
                          userName: _userNameController.text));
                    }
                    if (state is SignupFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error.toString())));
                    }
                  },
                  builder: (context, state) {
                    if (state is SignupInitial) {
                      return AuthWideBlueButton(
                          lable: "Signup",
                          dispatcher: () {
                            context.read<SignupBloc>().add(SignupRequested(
                                user: User(
                                    email: _emailController.text,
                                    fullName: _fullNameController.text,
                                    userName: _userNameController.text)));
                          },
                          formKey: _formKey);
                    }
                    if (state is SigningUp) {
                      return const AuthLoadingButton();
                    }
                    return Container();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const GreyText(text: "Already have an account?"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          navCubit.toLoginScreen();
                        },
                        child: LinkText(
                          text: "Login",
                          navigator: () {
                            navCubit.toLoginScreen();
                          },
                          color: const Color.fromRGBO(255, 114, 76, 1),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
