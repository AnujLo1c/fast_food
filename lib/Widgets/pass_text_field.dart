import 'package:flutter/material.dart';

class PassTextField extends StatefulWidget {
  const PassTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.validator, // Add validator parameter
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator; // Validator function

  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  var passNotVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(  // Use TextFormField instead of TextField
      controller: widget.controller,
      obscureText: passNotVisible,
      decoration: InputDecoration(
        hintText: widget.hint,
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
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passNotVisible = !passNotVisible;
            });
          },
          icon: Icon(passNotVisible ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      validator: widget.validator,
    );
  }
}
