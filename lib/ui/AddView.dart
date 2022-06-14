import 'package:flutter/material.dart';

import '../net/flutterfire.dart';
import 'home.dart';

class Add_View extends StatefulWidget {
  const Add_View({Key? key}) : super(key: key);

  @override
  State<Add_View> createState() => _Add_ViewState();
}

class _Add_ViewState extends State<Add_View> {
  List<String> coins = [
    'bitcoin',
    'wazirx',
    'tether',
    'polkadot',
    'tron',
    'dogecoin',
    'ethereum',
    'binancecoin',
  ];
  String dropdownValue = 'bitcoin';
  final TextEditingController _amountContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Coins"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: dropdownValue,
              onChanged: (value) {
                setState(() {
                  dropdownValue = value.toString();
                });
              },
              items: coins.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              // width: MediaQuery.of(context).size.width/1.5,
              child: TextFormField(
                controller: _amountContoller,
                decoration: InputDecoration(
                  labelText: "Amount of coin",
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.7,
              height: 40,
              child: MaterialButton(
                onPressed: () async {
                  await addCoin(dropdownValue, _amountContoller.text);
                  Navigator.of(context).pop();
                },
                child: Text("ADD"),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
