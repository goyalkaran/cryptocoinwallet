import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_crypto_wallet/net/api_methods.dart';
import 'package:my_crypto_wallet/net/flutterfire.dart';
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
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Add Coin',
          style: TextStyle(
              color: Colors.white,
              fontFamily: "BalooBhai",
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade400,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .collection('Coins')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 15,
                      right: 15,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green.shade200,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: MediaQuery.of(context).size.height / 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Coin: ${document.id}",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,fontFamily: "BalooBhai",
                              ),
                            ),
                            Text(
                              "Price: ₹${getValues(document.id, document.get('Amount')).toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,fontFamily: "BalooBhai",
                              ),
                            ),
                            IconButton(
                                onPressed: () async {
                                  await removeCoin(document.id);
                                },
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.white,
                                ))
                          ],
                        )),
                  );
                }).toList(),
              );
            },
          ),
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
          color: Colors.black,
        ),
        backgroundColor: Colors.green.shade200,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
