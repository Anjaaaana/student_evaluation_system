import 'package:flutter/material.dart';

actions(BuildContext context, String name, type) {
  showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });

        return AlertDialog(
          title: Text(
            ' ${type} ${name}',
            style: TextStyle(
                color: type == 'is Present'
                    ? Colors.green
                    : type == 'is Absent'
                        ? Colors.red
                        : Colors.black),
          ),
        );
      });
}
