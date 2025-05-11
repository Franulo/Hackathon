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
  Map<String, dynamic>? agentResult;
  void sentRequest() async {
    final url = Uri.parse('http://10.1.2.45:8000/search'); // change to FastAPI

    final body = {
      "website": selectedWebsite ?? 'Flatfox',
      "rentFrom": rentFrom.textControl.text,
      "rentTo": rentTo.textControl.text,
      "city": city.textControl.text,
      "country": country.textControl.text,

      "first_name": firstName.textControl.text,
      "last_name": lastName.textControl.text,
      "age": int.parse(age.textControl.text),
      "job": job.textControl.text,
      "gender": selectedGender ?? 'Male',
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      //   print("Server response: ${response.body}");
      // } catch (e) {
      //   print("Error sending request: $e");
      // }
      final data = jsonDecode(response.body);

      print("Response result field: ${data["result"]}");
      print("Type of result: ${data["result"].runtimeType}");

      final resultMap = data["result"];
      setState(() {
        final result = data["result"];
        if (result is Map<String, dynamic>) {
          agentResult = result;
        } else {
          agentResult = {"title": "No Title", "url": "No URL"};
        }
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  Inputfield rentFrom = Inputfield(type: 'rentFrom', width: 100, heigth: 50);
  Inputfield rentTo = Inputfield(type: 'rentTo', width: 100, heigth: 50);
  Inputfield city = Inputfield(type: 'city', width: 100, heigth: 50);
  Inputfield country = Inputfield(type: 'country', width: 100, heigth: 50);

  Inputfield firstName = Inputfield(type: 'First Name', width: 100, heigth: 50);
  Inputfield lastName = Inputfield(type: 'Last Name', width: 100, heigth: 50);
  Inputfield age = Inputfield(type: 'Age', width: 100, heigth: 50);
  Inputfield job = Inputfield(type: 'job/study', width: 100, heigth: 50);
  Inputfield interests = Inputfield(type: 'Interests', width: 200, heigth: 100);

  String? selectedWebsite;
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Front')),
      body: SingleChildScrollView(
        // Added for scrollable content
        padding: EdgeInsets.all(16), // Added padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Where to look:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              width: 200, // Increased width
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Website',
                  border: OutlineInputBorder(),
                  filled: true,
                ),
                value: selectedWebsite, // Changed from selectedGender
                items:
                    ['flatfox', 'homegate', 'wgzimmer']
                        .map(
                          (website) => DropdownMenuItem(
                            value: website,
                            child: Text(website),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedWebsite = value; // Changed from selectedGender
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              "What to look for:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: rentFrom), // Made responsive
                SizedBox(width: 16),
                Expanded(child: rentTo),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: city),
                SizedBox(width: 16),
                Expanded(child: country),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Your data:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: firstName),
                SizedBox(width: 16),
                Expanded(child: lastName),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: age),
                Expanded(child: job),
                SizedBox(width: 16),
                Container(
                  width: 200,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    value: selectedGender,
                    items:
                        ['Male', 'Female', 'Other']
                            .map(
                              (gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            interests,
            SizedBox(height: 24),
            ElevatedButton(
              // Changed from TextButton for better visibility
              onPressed: sentRequest,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: Text("Send Request", style: TextStyle(fontSize: 16)),
            ),

            if (agentResult != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "ohooo thats the Result!!: ${agentResult?['url'] ?? 'No link returned'}",
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
