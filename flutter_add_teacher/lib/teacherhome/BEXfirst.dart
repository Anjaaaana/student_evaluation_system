import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_add_teacher/pages4/internalmarks.dart';
import 'package:flutter_add_teacher/screens/login_screen.dart';
import 'package:flutter_add_teacher/swipe/swipehome.dart';

class HomeScreeniii extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreeniii> {
  var size, height, width;

  get body => null;
  @override
  Widget build(BuildContext context) {
    //to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dashboard'),
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
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .3,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                      height: 64,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                              AssetImage('assests/Images/BCT.png'),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'BEX',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                'I/I',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: Text(
                          'Attendance',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 80),
                            primary: Colors.redAccent),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SampleDropdown()),
                          );
                        },
                        child: Text(
                          'Internal Marks',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 80),
                            primary: Colors.redAccent),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  childText(String s) {}
}