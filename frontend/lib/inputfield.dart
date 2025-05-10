import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  Inputfield({
    super.key,
    required this.type,
    required this.width,
    required this.heigth,
  });

  final String type;
  final double width;
  final double heigth;
  final TextEditingController textControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      child: TextField(
        controller: textControl,
        decoration: InputDecoration(labelText: type),
      ),
    );
  }
}
