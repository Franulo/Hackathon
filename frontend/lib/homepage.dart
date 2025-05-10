import 'package:flutter/material.dart';
import 'package:frontend/inputfield.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void sentRequest() {
    print("request sent from${firstName.textControl.text}");
  }

  Inputfield firstName = Inputfield(type: 'First Name', width: 100, heigth: 50);
  Inputfield lastName = Inputfield(type: 'Last Name', width: 100, heigth: 50);
  Inputfield age = Inputfield(type: 'Age', width: 100, heigth: 50);
  Inputfield gender = Inputfield(type: 'Gender', width: 100, heigth: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Front')),
      body: Column(
        children: [
          Row(children: [firstName, lastName]),
          Row(children: [age, gender]),
          TextButton(onPressed: sentRequest, child: Text("Sent Request")),
        ],
      ),
    );
  }
}
