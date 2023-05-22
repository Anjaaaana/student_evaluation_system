import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SingleStudentAttendance extends StatefulWidget {
  final String studentId;
  const SingleStudentAttendance({Key? key, required this.studentId})
      : super(key: key);

  @override
  State<SingleStudentAttendance> createState() =>
      _SingleStudentAttendanceState();
}

class _SingleStudentAttendanceState extends State<SingleStudentAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  _body() {
    final Stream<QuerySnapshot> attendanceStream = FirebaseFirestore.instance
        .collection('attendance')
        .where('student_id', isEqualTo: widget.studentId)
        .snapshots();

    CollectionReference student =
        FirebaseFirestore.instance.collection('students');

    String studentName = "";

    student.doc(widget.studentId).get().then((value) {
      var studentData = value.data() as Map<String, dynamic>;
      print(studentData['name']);
      studentName = studentData['name'];
      print(studentName);
    }).catchError((err) => print(err));
    return StreamBuilder<QuerySnapshot>(
        stream: attendanceStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something Went Wrong');
          }
          if (!snapshot.hasData) {
            print('No Data here');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List storedocs = [];
          int count = 0;

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            print(a);
            storedocs.add(a);
            if (a['is_present'].toString() == 'true') {
              count++;
            }
            a['id'] = document.id;
          }).toList();

          FirebaseFirestore.instance
              .collection("students")
              .doc(widget.studentId)
              .update({"attendadnce_count": count});
          print(count);

          return Scaffold(
            appBar: AppBar(
              title: Text(studentName),
            ),
            body: Center(
              child: Table(
                border: TableBorder.all(),
                children: [
                  buildRow(['DATE', 'PRESENT'], isHeader: true),
                  for (var i = 0; i < storedocs.length; i++) ...[
                    buildRow([
                      storedocs[i]['date'].toString(),
                      storedocs[i]['is_present'].toString(),
                    ]),
                  ]
                ],
              ),
            ),
          );
        });
  }

  buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
        children: cells.map((cell) {
          final style = TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontSize: 18,
          );
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text(cell)),
          );
        }).toList(),
      );
}
