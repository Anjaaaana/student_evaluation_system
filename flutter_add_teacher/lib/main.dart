import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_add_teacher/addteacher/pages/home_page.dart';
import 'package:flutter_add_teacher/swipe/attendance.dart';
import 'package:flutter_add_teacher/swipe/swipehome.dart';
import 'package:flutter_add_teacher/teacherhome/homescreen.dart';
import 'package:flutter_add_teacher/screens/adminpage.dart';
import 'package:flutter_add_teacher/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home:LoginScreen(),
    );
  }
}
