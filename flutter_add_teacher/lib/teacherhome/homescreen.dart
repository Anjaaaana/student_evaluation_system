import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_add_teacher/pages4/finalmark.dart';
import 'package:flutter_add_teacher/pages4/internalmarks.dart';
import 'package:flutter_add_teacher/screens/login_screen.dart';
import 'package:flutter_add_teacher/swipe/attendance.dart';
import 'package:flutter_add_teacher/swipe/swipehome.dart';
import 'package:flutter_add_teacher/teacherhome/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './viewmarks.dart';

class HomeScreeni extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreeni> {
  var size, height, width;
  List<String> _docIdList = [];
  void initState() {
    fetchStudents();
    super.initState();
  }

  fetchStudents() async {
    QuerySnapshot qs =
        await FirebaseFirestore.instance.collection("students").get();

    void updatemarks(String marks, var selectedStudentDocumentId) async {
      FirebaseFirestore.instance
          .collection("students")
          .doc(selectedStudentDocumentId)
          .update({"totalMarks": marks});
    }

    double total = 0.0;

    for (var each in qs.docs) {
      var at = each.get("attendadnce_count");
      var marks = each.get("marks");
      print(at + int.parse(marks));
      at = (at / 14) * 4;
      total = at + int.parse(marks);
      updatemarks(total.toString(), each.id);
    }
    void marksCalculation() {
      var total = 0.0;

      for (var each in qs.docs) {
        var at = double.parse(each.get("attendadnce_count"));
        var marks = double.parse(each.get("marks"));
        print(each.get("marks"));
        at = (at / 14) * 4;
        total = at + marks;

        updatemarks(total.toString(), each.id);
      }
    }

    // marksCalculation();
  }

  get body => null;
  @override
  Widget build(BuildContext context) {
    //to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dashboard'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                )
              },
              child: Text('Log Out', style: TextStyle(fontSize: 20.0)),
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
            )
          ],
        ),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => HomeScreen("username")))),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .3,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                      height: 64,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/student.png'),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'BCT',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                'I/I',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: Text(
                          'Attendance',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 80),
                            primary: Colors.redAccent),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SampleDropdown()),
                          );
                        },
                        child: Text(
                          'Internal Marks',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 80),
                            primary: Colors.redAccent),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(title: 'Attendance List')),
                          );
                        },
                     
                        child: Text(
                          'View attendace',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 80),
                            primary: Colors.redAccent),
                      ),
                    ],
                  ),
                     SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () =>
                            {print("this is success"), fetchStudents(),
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>viewmarks() )),
                            
                            
                            },
                            
                        child: Text(
                          'View Marks',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 80),
                            primary: Colors.redAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  childText(String s) {}
}
