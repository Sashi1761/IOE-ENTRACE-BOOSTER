import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Rank',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
       
      Expanded(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .orderBy('score')
                .snapshots(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData)
                return  Center(
                  child: CircularProgressIndicator(),
                );
              final users = snapshot.data!.docs;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.teal.shade100,
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(users[index]['photoUrl'])),
                      title: Text(
                        users[index]['name'],
                      ),
                      trailing: Text(
                        users[index]['score'].toString(),
                        style:const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
                itemCount: users.length,
              );
            })),
      )
        ],
      ),
    );
  }
}
