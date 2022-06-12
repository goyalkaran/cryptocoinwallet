import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'AddView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Coin to your account',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('User')
                  .doc(FirebaseAuth.instance.currentUser?.uid)
                  .collection('Coins')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((document) {
                    return Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Coin Name: ${document.id}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Amount Owned: ${document.get('Amount')}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ]),
                    );
                  }).toList(),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add_View()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
