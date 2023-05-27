import 'package:flutter/material.dart';

Widget infoText({required String type, required String text}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        type,
        style: TextStyle(color: Colors.blueGrey[300], fontSize: 16),
      ),
      Flexible(
          child: Text(
        text,
        style: TextStyle(color: Colors.blueGrey[100], fontSize: 16),
      ))
    ],
  );
}
