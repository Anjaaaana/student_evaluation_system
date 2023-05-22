import 'package:flutter/material.dart';
import 'package:flutter_add_teacher/swipe/alterFunctions.dart';
import 'package:flutter_add_teacher/swipe/constants.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;

  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();

  CollectionReference students =
      FirebaseFirestore.instance.collection('students');

  CollectionReference attendance =
      FirebaseFirestore.instance.collection('attendance');

  get images => null;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something Went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          _swipeItems = [];

          for (int i = 0; i < storedocs.length; i++) {
            _swipeItems.add(SwipeItem(
                content: Content(text: storedocs[i]['name']),
                likeAction: () {
                  actions(context, storedocs[i]['name'], 'Present');
                  // Stream<QuerySnapshot> studentsById = FirebaseFirestore
                  //     .instance
                  //     .collection('attendance')
                  //     .where('key.student_id', isEqualTo: storedocs[i]['id'])
                  //     .where(
                  //       'key.date',
                  //       isEqualTo: (DateTime.now().day).toString() +
                  //           "-" +
                  //           (DateTime.now().month).toString() +
                  //           "-" +
                  //           (DateTime.now().year).toString(),
                  //     )
                  //     .snapshots();

                  attendance
                      .add({
                        'student_id': storedocs[i]['id'],
                        'date': (DateTime.now().day).toString() +
                            "-" +
                            (DateTime.now().month).toString() +
                            "-" +
                            (DateTime.now().year).toString(),
                        'is_present': true
                      })
                      .then((res) => print('present'))
                      .catchError((error) => print(error));
                  print('present');
                  print(storedocs[i]['id']);
                },
                nopeAction: () {
                   actions(context, storedocs[i]['name'], 'Absent');
                  attendance
                      .add({
                        'student_id': storedocs[i]['id'],
                        'date': (DateTime.now().day).toString() +
                            "-" +
                            (DateTime.now().month).toString() +
                            "-" +
                            (DateTime.now().year).toString(),
                        'is_present': false
                      })
                      .then((res) => print('absent'))
                      .catchError((error) => print(error));
                  print('present');
                  print(storedocs[i]['id']);
                },
                superlikeAction: () {
                  print('Very Attentive');
                }));
          }

          _matchEngine = MatchEngine(swipeItems: _swipeItems);

          return Scaffold(
            appBar: AppBar(
              title: Text('Attendance'),
            ),
            body: Container(
              child: Column(
                children: [
                  SizedBox(height: 70),
                  Expanded(
                      child: Container(
                    child: SwipeCards(
                      matchEngine: _matchEngine!,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(pictures[0
                                   ]),
                                  fit: BoxFit.cover),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                storedocs[index]['name'],
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        );
                      },
                      onStackFinished: () {
                        return ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('The List is over')));
                      },
                    ),
                  )),
                ],
              ),
            ),
          );
        });
  }
}

class Content {
  final String? text;
  Content({this.text});
}
