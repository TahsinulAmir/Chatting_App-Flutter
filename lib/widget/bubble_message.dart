import 'package:flutter/material.dart';

class BubbleMessage extends StatelessWidget {
  BubbleMessage({super.key, required this.message, required this.isMe});

  // constructor
  String message;
  bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      // jika isMe maka mainAxisAligment.end, jika bukan start
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 150,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // Jika isMe maka warna grey, jika bukan isMe maka warna blue
            color: isMe ? Colors.blue : Colors.grey,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
