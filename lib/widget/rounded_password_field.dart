import 'package:auction_app_flutter/widget/text_field_container.dart';
import 'package:flutter/material.dart';
import '../utils/const.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onPressed;
  final void Function(String) onChanged;
  final bool visible;
  final String hintText;

  const RoundedPasswordField({
    Key? key,
    required this.controller,
    required this.onPressed,
    required this.visible,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      label: kPass,
      child: TextFormField(
        onChanged: onChanged,
        enableSuggestions: false,
        autocorrect: false,
        controller: controller,
        obscureText: visible,
        keyboardType: TextInputType.text,
        // maxLength: ,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.remove_red_eye,
              color: Colors.blue,
            ),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
