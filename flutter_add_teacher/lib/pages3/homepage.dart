import 'package:flutter/material.dart';
import 'package:flutter_add_teacher/screens/adminpage.dart';
import 'package:flutter_add_teacher/pages3/add_faculty.dart';
import 'package:flutter_add_teacher/pages3/list_faculty.dart';

class HomePageFaculty extends StatefulWidget {
  const HomePageFaculty({Key? key}) : super(key: key);

  @override
  _HomePageFacultyState createState() => _HomePageFacultyState();
}

class _HomePageFacultyState extends State<HomePageFaculty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Faculty List'),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddFacultyPage(),
                    ),
                  )
                },
                child: Text('Add', style: TextStyle(fontSize: 20.0)),
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              )
            ],
          ),
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AdminPage()))),
        ),
        body: ListFacultyPage());
  }
}
