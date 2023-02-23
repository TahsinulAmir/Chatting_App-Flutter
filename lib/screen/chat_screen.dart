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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/B8x1tzwNzIEW2WVF404v/messages')
              // menambahkan data & dibuat mapping
              .add({'text': "New Data"});
        },
        child: Icon(Icons.add),
      ),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chat').snapshots(),
        builder: (context, snapshot) {
          // jika snapshot aktif
          if (snapshot.connectionState == ConnectionState.active) {
            // mengambil data chats
            final chatList = snapshot.data!.docs;
            // maka..
            return ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                // get chat
                final chat = chatList[index];
                return ListTile(
                  title: Text(chat['text']),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
