import 'package:ethio_agri_ceft_app/presentation/exports.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

// ignore: must_be_immutable
class PasswordField extends StatefulWidget {
  PasswordField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.validator,
      this.isVisible = true})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;
  bool isVisible;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: !showPassword,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isVisible
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: FaIcon(
                  showPassword
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  size: 20,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
