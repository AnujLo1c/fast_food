import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.deepOrange[600],
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
