import 'package:chatting_app/widget/message.dart';
import 'package:chatting_app/widget/new_messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        appBar: AppBar(
          title: Text("Chatting App"),
          actions: [
            IconButton(
              onPressed: () {
                // Untuk log out
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Messages(),
              ),
              NewMessages(),
            ],
          ),
        ));
  }
}
