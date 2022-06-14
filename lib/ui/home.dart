import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_crypto_wallet/net/api_methods.dart';
import 'AddView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> coinName = [
    "bitcoin",
    "wazirx",
    "tether",
    "polkadot",
    "tron",
    "dogecoin",
    "ethereum",
    "binancecoin",
  ];
  double bitcoin = 0.0;
  double wazirx = 0.0;
  double tether = 0.0;
  double polkadot = 0.0;
  double tron = 0.0;
  double dogecoin = 0.0;
  double ethereum = 0.0;
  double binancecoin = 0.0;
  @override
  void initState() {
    getValues();
  }

  getValues() async {
    bitcoin = await getPrice('bitcoin');
    wazirx = await getPrice('wazirx');
    tether = await getPrice('tether');
    polkadot = await getPrice('polkadot');
    tron = await getPrice('tron');
    dogecoin = await getPrice('dogecoin');
    ethereum = await getPrice('ethereum');
    binancecoin = await getPrice('binancecoin');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getValues(String id, double amount) {
      switch (id) {
        case 'bitcoin':
          return bitcoin * amount;
        case 'wazirx':
          return wazirx * amount;
        case 'tether':
          return tether * amount;
        case 'polkadot':
          return polkadot * amount;
        case 'tron':
          return tron * amount;
        case 'dogecoin':
          return dogecoin * amount;
        case 'ethereum':
          return ethereum * amount;
        case 'binancecoin':
          return binancecoin * amount;
        default:
          return 0;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Coin to your account',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
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
                            Text(
                              "Coin Name: ${(document.id).toUpperCase()}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Amount Owned: \₹${getValues(document.id, document.get('Amount')).toStringAsFixed(2)}",
                              style: TextStyle(color: Colors.white),
                            ),

                          ]),
                    );
                  }).toList(),
                );
              }),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          FloatingActionButton(
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
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Add_View()),
              );
            },
            child: Icon(
              Icons.add_outlined,
              color: Colors.white,
            ),
            backgroundColor: Colors.black,
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
