import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  // inisiasi database
  final db = FirebaseFirestore.instance;

  // get collection
  final Stream<QuerySnapshot> _chatStream = FirebaseFirestore.instance
      .collection('chats/B8x1tzwNzIEW2WVF404v/messages')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _chatStream,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Chat List"),
                );
              },
            );
          }),
    );
  }
}
