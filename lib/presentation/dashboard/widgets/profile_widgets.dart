import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class ProfileInfoCard extends StatelessWidget {
  final IconButton icon;
  final String text;
  final void Function() dispatcher;
  const ProfileInfoCard(
      {Key? key,
      required this.icon,
      required this.text,
      required this.dispatcher})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dispatcher,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: icon,
            iconSize: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(text,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )),
          )
        ],
      ),
    );
  }
}

class BuildBottomSheet extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController userHandleController;
  final TextEditingController userEmailController;

  final void Function() submit;

  const BuildBottomSheet(
      {Key? key,
      required this.userNameController,
      required this.userHandleController,
      required this.userEmailController,
      required this.submit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        height: size.height / 1.17,
        width: size.width,
        child: ListView(children: [
          SizedBox(
            height: size.height / 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          )
        ]),
      ),
    );
  }
}

class ProfileEditBtn extends StatelessWidget {
  final void Function() dispatcher;
  final String text;
  const ProfileEditBtn({Key? key, required this.dispatcher, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: dispatcher,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(42, 44, 65, 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.pencil,
              color: Color.fromRGBO(255, 114, 76, 1),
              size: 19,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(text,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Color.fromRGBO(255, 114, 76, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )),
          ],
        ),
      ),
    );
  }
}
