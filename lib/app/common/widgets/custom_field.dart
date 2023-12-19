import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.maxLength,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final int? maxLength;
  final TextInputType textInputType;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      maxLength: maxLength,
      onChanged: (val) {
        onChanged(val);
      },
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
