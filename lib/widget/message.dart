import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
    );
  }
}
