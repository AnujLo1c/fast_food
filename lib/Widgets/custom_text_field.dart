import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        constraints: const BoxConstraints(minHeight: 40),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepOrange),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepOrange),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }
}
