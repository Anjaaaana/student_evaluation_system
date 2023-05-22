import 'package:cloud_firestore/cloud_firestore.dart';

takeAttandance() {
  //some code
  String docId = DateTime.now().year.toString() +
      DateTime.now().month.toString() +
      DateTime.now().day.toString();

  FirebaseFirestore.instance
      .collection("Teacher")
      .doc("teacheremailid")
      .collection("workingdays")
      .doc(docId)
      .set({"value": true});
}

getWorkingDays(String teacherEmail) async {
  QuerySnapshot qs = await FirebaseFirestore.instance
      .collection("Teacher")
      .doc(teacherEmail)
      .collection("workingdays")
      .get();
  int workingdays = qs.docs.length;
}
