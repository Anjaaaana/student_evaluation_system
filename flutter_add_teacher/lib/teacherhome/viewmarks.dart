import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class viewmarks extends StatefulWidget {
  const viewmarks({Key? key}) : super(key: key);

  @override
  State<viewmarks> createState() => _viewmarksState();
}

class _viewmarksState extends State<viewmarks> {
  void initState() {
    fetchStudents();
    super.initState();
  }

  List name = [];
  List marks = [];

  fetchStudents() async {
    QuerySnapshot qs =
        await FirebaseFirestore.instance.collection("students").get();
    for (var each in qs.docs) {
      name.add(each.get("name"));
      marks.add(each.get("totalMarks"));
      print(each.get("name"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Marks")),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: name.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                child: Center(
                    child: Text('Name= ${name[index]} marks= ${marks[index]}')),
              );
            }));
  }
}
