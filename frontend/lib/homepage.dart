import 'package:flutter/material.dart';
import 'package:frontend/inputfield.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Front')),
      body: Column(
        children: [
          Row(
            children: [
              Inputfield(type: 'First Name', width: 100, heigth: 50),
              Inputfield(type: 'Last Name', width: 100, heigth: 50),
            ],
          ),
          Row(
            children: [
              Inputfield(type: 'Age', width: 100, heigth: 50),
              Inputfield(type: 'Gender', width: 100, heigth: 50),
            ],
          ),
        ],
      ),
    );
  }
}
