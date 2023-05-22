import 'package:flutter/material.dart';
import 'package:flutter_add_teacher/addteacher/pages/home_page.dart';
import 'package:flutter_add_teacher/dropdown/sample_dropdown.dart';
import 'package:flutter_add_teacher/pages1/homepage.dart';
import 'package:flutter_add_teacher/pages2/homepage.dart';
import 'package:flutter_add_teacher/pages3/homepage.dart';
import 'package:flutter_add_teacher/screens/login_screen.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Admin Page'),
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
                MaterialPageRoute(builder: (context) => LoginScreen()))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(
              height: 10,
            ),
            new SizedBox(
              width: 250.0,
              height: 60.0,
              child: ElevatedButton(
                child: Text(
                  "Add Students",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            new SizedBox(
              width: 250.0,
              height: 60.0,
              child: ElevatedButton(
                child: Text(
                  "Add Teachers",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePageState()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            new SizedBox(
              width: 250.0,
              height: 60.0,
              child: ElevatedButton(
                child: Text(
                  "Add Class",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePageClass()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            new SizedBox(
              width: 250.0,
              height: 60.0,
              child: ElevatedButton(
                child: Text(
                  "Add Faculty",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomePageFaculty()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
