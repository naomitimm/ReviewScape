import 'package:ethio_agri_ceft_app/domain/user/user_model.dart';
import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class DashboardScreen extends StatefulWidget {
  final User user;
  const DashboardScreen({super.key, required this.user});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int myIndex = 0;
  late User newUser;
  @override
  void initState() {
    newUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List myPages = [
      HomeScreen(user: newUser),
      WishlistScreen(user: newUser),
      ProfileScreen(user: newUser)
    ];

    return Scaffold(
        body: myPages[myIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(244, 244, 248, 1),
          elevation: 40.0,
          showUnselectedLabels: false,
          selectedItemColor: const Color.fromRGBO(255, 114, 76, 1),
          selectedLabelStyle: GoogleFonts.montserrat(
            textStyle: const TextStyle(fontWeight: FontWeight.w700),
          ),
          currentIndex: myIndex,
          onTap: (int index) {
            setState(() {
              myIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.house,
                  color: Color.fromRGBO(255, 114, 76, 1),
                  size: 25,
                ),
                label: "Home"),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.bagShopping,
                color: Color.fromRGBO(255, 114, 76, 1),
                size: 25,
              ),
              label: "Wishlist",
            ),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.userLarge,
                  color: Color.fromRGBO(255, 114, 76, 1),
                  size: 25,
                ),
                label: "Profile"),
          ],
        ));
  }
}
