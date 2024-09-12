import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({super.key, required this.text, this.contentInsets, this.control});
  String text;
  EdgeInsets? contentInsets;
  TextEditingController? control;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: contentInsets,
        hintText: text,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
