import 'package:flutter/material.dart';

class Internal extends StatefulWidget {
  const Internal({Key? key}) : super(key: key);

  @override
  _InternalState createState() => _InternalState();
}

class _InternalState extends State<Internal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student's Marks"),
        centerTitle: true,
      ),
    );
  }
}
