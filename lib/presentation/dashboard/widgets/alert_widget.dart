import 'package:ethio_agri_ceft_app/presentation/exports.dart';

enum DialogueAction { yes, cancel }

class AlertDialogue {
  static Future<DialogueAction> logoutDialogue(BuildContext context,
      String title, String body, void Function() navigator) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((context) {
          return AlertDialog(
            elevation: 2.0,
            title: Text(
              title,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            content: Text(
              body,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(DialogueAction.cancel);
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
              const SizedBox(
                width: 40,
              ),
              TextButton(
                  onPressed: navigator,
                  child: Text(
                    "Logout",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
              const SizedBox(
                width: 5,
              ),
            ],
          );
        }));
    return (action != null) ? action : DialogueAction.cancel;
  }
}
