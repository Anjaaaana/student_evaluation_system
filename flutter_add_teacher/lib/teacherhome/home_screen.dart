import 'package:flutter/material.dart';
import 'package:flutter_add_teacher/screens/login_screen.dart';
import 'package:flutter_add_teacher/teacherhome/BEXfirst.dart';
import 'package:flutter_add_teacher/teacherhome/bctsecond.dart';
import 'package:flutter_add_teacher/teacherhome/homescreen.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  HomeScreen(this.username);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final items = ['BCT', 'BCE', 'BEX'];
  String faculty = "BCT";

  var items = [
    'BCT',
    'BEX.',
  ];
  String year = "First";
  var year1 = ['First', 'Second', 'Third...', 'Fourth..'];
  String sem = "I";
  var semester = ['I', 'II'];

  set dropdownValue(String dropdownValue) {}

  @override
  Widget build(BuildContext context) {
    final myNextButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.redAccent,
      child: MaterialButton(
        minWidth: 100.0,
        padding: EdgeInsets.all(10),
        onPressed: () {
          if (faculty == 'BCT' && year == 'First' && sem == 'I') {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreeni()));
          } else if (faculty == 'BCT' && year == 'First' && sem == 'II') {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreenii()));
          } else if (faculty == 'BEX' && year == 'First' && sem == 'I') {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreeniii()));
          }
        },
        child:
            Text('Next', style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()))),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select any Faculty.",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              DropdownButton(
                hint: Text(
                  "Select any Faculty",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                value: faculty,
                icon: Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                onChanged: (String? newValue) {
                  print(newValue.toString());
                  setState(() {
                    faculty = newValue!;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Select any year',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              DropdownButton(
                hint: Text(
                  "Select any Year",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                value: year,
                icon: Icon(Icons.keyboard_arrow_down),
                items: year1.map((String year) {
                  return DropdownMenuItem(value: year, child: Text(year));
                }).toList(),
                onChanged: (String? newValue) {
                  print(newValue.toString());
                  setState(() {
                    year = newValue!;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Select any semester',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              DropdownButton(
                hint: Text(
                  "Select any Semester",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                value: sem,
                icon: Icon(Icons.keyboard_arrow_down),
                items: semester.map((String semester) {
                  return DropdownMenuItem(
                      value: semester, child: Text(semester));
                }).toList(),
                onChanged: (String? newValue) {
                  print(newValue.toString());
                  setState(() {
                    sem = newValue!;
                  });
                },
              ),
              SizedBox(height: 40),
              myNextButton,
            ],
          ),
        ),
      ),
    );
  }
}
