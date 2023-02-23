import 'package:chatting_app/widget/bubble_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(), // createdAt => urutkan dari waktu yang terbaru, descanding => daribawah keatas
      builder: (context, snapshot) {
        // jika snapshot aktif
        if (snapshot.connectionState == ConnectionState.active) {
          // mengambil data chats
          final chatList = snapshot.data!.docs;
          // maka..
          return ListView.builder(
            reverse: true, // meletakkan text chat di bawah
            itemCount: chatList.length,
            itemBuilder: (context, index) {
              // get chat
              final chat = chatList[index];
              return BubbleMessage(
                message: chat['text'],
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
