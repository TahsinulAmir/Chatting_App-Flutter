import 'package:flutter/material.dart';

class BubbleMessage extends StatelessWidget {
  BubbleMessage({super.key, required this.message, required this.isMe});

  // constructor
  String message;
  bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 150,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
