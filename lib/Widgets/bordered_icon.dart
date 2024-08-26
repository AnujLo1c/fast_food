import 'package:flutter/material.dart';

class BorderedIcon extends StatelessWidget {
  const BorderedIcon({super.key, required this.icon});
  final icon;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Color.fromRGBO(130, 120, 110, 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}