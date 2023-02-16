import 'package:ethio_agri_ceft_app/infrustructure/user/prefrence_services.dart';
import 'package:ethio_agri_ceft_app/infrustructure/user/user_cache.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _prefrenceServices = PrefrenceServices();

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _prefrenceServices.getSettings();
    setState(() {
      _emailController.text = settings.email;
    });
  }

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
                child: GreyText(text: "Log in to your account")),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(children: [
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
                  height: 40,
                ),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccesful) {
                      navCubit.toDashboardScreen(User(
                          email: _emailController.text,
                          fullName: 'Naomi Timothy',
                          userName: 'naomitimm'));
                    }
                    if (state is LoginFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error.toString())));
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginInitial) {
                      return AuthWideBlueButton(
                          lable: "Login",
                          dispatcher: () {
                            _saveSettings();
                            context.read<LoginBloc>().add(LoginRequested(
                                email: _emailController.text,
                                password: _passwordController.text));
                          },
                          formKey: _formKey);
                    }

                    if (state is LoggingIn) {
                      return const AuthLoadingButton();
                    }
                    return Container();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const GreyText(text: "Don't have an account yet?"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        navCubit.toSignupScreen();
                      },
                      child: LinkText(
                        color: const Color.fromRGBO(255, 114, 76, 1),
                        text: "Sign Up",
                        navigator: () {
                          navCubit.toSignupScreen();
                        },
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ]),
        ));
  }

  void _saveSettings() {
    final newSettings = Settings(email: _emailController.text);
    _prefrenceServices.saveSettings(newSettings);
  }
}
