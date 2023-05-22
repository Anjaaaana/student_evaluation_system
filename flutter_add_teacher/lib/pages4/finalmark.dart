import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FinalMarks extends StatefulWidget {
  final String studentId;
  const FinalMarks({Key? key, required this.studentId}) : super(key: key);

  @override
  State<FinalMarks> createState() => _FinalMarks();
}

class _FinalMarks extends State<FinalMarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("test"));
  }

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

    double marksCalculation() {
      var total = 0.0;
      for (var each in qs.docs) {
        var at = each.get("attendadnce_count");
        var marks = each.get("marks");

        at = (at * 4) / 14;
        total = at + marks;
        updatemarks(total.toString(), each.id);
      }
      return total;
    }
  }
}
