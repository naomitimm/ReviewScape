import 'package:ethio_agri_ceft_app/presentation/dashboard/widgets/profile_widgets.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  ProfileScreen({super.key, required this.user});

  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final userEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavigationCubit>();

    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 244, 248, 1),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PageHeadline(
                    text: "Profile",
                    color: Color.fromRGBO(42, 44, 65, 1),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: BlocConsumer<LogoutBloc, LogoutState>(
                      listener: (context, state) {
                        if (state is LogoutSuccessful) {
                          navCubit.toLandingScreen();
                          Navigator.of(context).pop(DialogueAction.yes);
                        }
                      },
                      builder: (context, state) {
                        if (state is Loggingout) {
                          return const CircularProgressIndicator(
                            color: Color.fromRGBO(255, 114, 76, 1),
                          );
                        }
                        if (state is Logoutfailed) {
                          return Text(state.error.toString());
                        }
                        return IconButton(
                            onPressed: () async {
                              await AlertDialogue.logoutDialogue(
                                  context,
                                  "Logout",
                                  "Are you sure you want to log out of ${user.userName}",
                                  (() {
                                context
                                    .read<LogoutBloc>()
                                    .add(LogoutRequested());
                              }));
                            },
                            icon: const Icon(Icons.settings),
                            iconSize: 25);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/orange_icons/user.png'),
                                    fit: BoxFit.cover))),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.fullName,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600),
                                )),
                            Text("@${user.userName}",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ProfileEditBtn(
                      dispatcher: () {
                        showBottomSheet(
                            context: context,
                            builder: ((context) => BuildBottomSheet(
                                  submit: (() {
                                    Navigator.of(context).pop();
                                  }),
                                  userNameController: fullNameController,
                                  userHandleController: usernameController,
                                  userEmailController: userEmailController,
                                )));
                      },
                      text: "Edit profile")
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  ProfileInfoCard(
                    icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.email_outlined,
                          color: Color.fromRGBO(255, 114, 76, 1),
                        )),
                    text: user.email,
                    dispatcher: () {},
                  ),
                  ProfileInfoCard(
                    icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.date_range,
                          color: Color.fromRGBO(255, 114, 76, 1),
                        )),
                    text: "Joined in January 2023",
                    dispatcher: () {},
                  ),
                ],
              ),
            ])));
  }
}
