import 'package:flutter/material.dart';

class Inputfield extends StatefulWidget {
  const Inputfield({
    super.key,
    required this.type,
    required this.width,
    required this.heigth,
  });

  final String type;
  final double width;
  final double heigth;

  @override
  State<Inputfield> createState() => _InputfieldState();
}

class _InputfieldState extends State<Inputfield> {
  TextEditingController textControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.heigth,
      child: TextField(
        controller: textControl,
        decoration: InputDecoration(labelText: widget.type),
      ),
    );
  }
}
