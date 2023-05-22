import 'package:flutter/material.dart';
import 'package:flutter_add_teacher/addteacher/pages/add_Teachers_page.dart';
import 'package:flutter_add_teacher/addteacher/pages/list_teachers_page.dart';
import 'package:flutter_add_teacher/screens/adminpage.dart';




class HomePageState extends StatefulWidget {
  const HomePageState({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title:Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
        Text('Teachers List'),
        ElevatedButton(
          onPressed: () => { 
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context)=> AddTeachersPage(),
              ),
            )
          },
          child:Text('Add', style: TextStyle(fontSize: 20.0)),
          style:ElevatedButton.styleFrom(primary: Colors.deepPurple),
      
          )
        ],
        ),
         automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => AdminPage()))),
    ),
    body:ListTeachersPage(),
    );
}
}