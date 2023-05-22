import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Attandance'),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
        ));
  }
}

Widget imageWidget(String image) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
  );
}
