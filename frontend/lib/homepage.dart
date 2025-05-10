import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/inputfield.dart';
import 'dart:convert';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // void sentRequest() {
  //   print("request sent from${firstName.textControl.text}");
  // }

  void sentRequest() async {
    final url = Uri.parse('http://10.1.2.45:8000/search'); // change to FastAPI

    final body = {
      "first_name": firstName.textControl.text,
      "last_name": lastName.textControl.text,
      "age": int.parse(age.textControl.text),
      "gender": gender.textControl.text,
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      print("Server response: ${response.body}");
    } catch (e) {
      print("Error sending request: $e");
    }
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
