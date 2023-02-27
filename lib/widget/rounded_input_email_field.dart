import 'package:auction_app_flutter/widget/text_field_container.dart';
import 'package:flutter/material.dart';
import '../utils/const.dart';

class RoundedInputEmailField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType textInputType;
  const RoundedInputEmailField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.textInputType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      label: kEmail,
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.blue,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}