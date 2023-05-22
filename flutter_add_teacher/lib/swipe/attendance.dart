import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_add_teacher/swipe/single_student_attendance.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _fetchAllStudentsFromAttendance();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<String> _studentIdWithAttendance = [];

  _fetchAllStudentsFromAttendance() async {
    var qs = await FirebaseFirestore.instance.collection("attendance").get();
    List<String> _tempStudentList = [];
    for (var each in qs.docs) {
      var stdid = each.get("student_id");
      if (!_tempStudentList.contains(stdid)) {
        _tempStudentList.add(stdid);
      }
    }
    _studentIdWithAttendance = _tempStudentList;
    setState(() {
      
    });
    print(_studentIdWithAttendance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Students")),
      body: SizedBox(
        width:200,
        height:300,
        child: ListView(
          children: [
            for(var each in _studentIdWithAttendance)_student(each)
          ],
        ),
      ),
    );
  }

  _student(String studentId) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => SingleStudentAttendance(studentId: studentId)));
        },
        child:Text(studentId)
      ),
    );
  }
}
