import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  String _message = '';
  final messageController = TextEditingController();

  void _sendMessage() async {
    // Jika pesannya/_message kosong makan tidak dikirim
    if (_message == '') {
      return;
    }

    // mendapaktan user yg terakhir login
    final user = await FirebaseAuth.instance.currentUser;
    // Jika pesan/_message tidak kosong maka akan menjalankan ini
    // Disimpan di collection chat dari variable _message
    FirebaseFirestore.instance.collection('chat').add({
      'text': _message,
      'createdAt': Timestamp.now(), // mengurutkan dari waktu yang terbaru
      'userId': user!.uid,
    });
    // menghapus text di TextField
    messageController.clear();
    // reset
    _message = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              onChanged: (value) {
                setState(() {
                  _message = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed: () {
              _sendMessage();
            },
            icon: Icon(
              Icons.send,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
