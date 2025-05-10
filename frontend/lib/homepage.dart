import 'dart:convert' show jsonEncode;
import 'package:flutter/material.dart';
import 'package:frontend/inputfield.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<void> sendToPython() async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/api'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': 'Hello from Flutter!'}),
    );
    print('Python replied: ${response.body}');
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
          TextButton(onPressed: sendToPython, child: Text("Sent Request")),
        ],
      ),
    );
  }
}
