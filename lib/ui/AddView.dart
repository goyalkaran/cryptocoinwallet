import 'package:flutter/material.dart';

class Add_View extends StatefulWidget {
  const Add_View({Key? key}) : super(key: key);

  @override
  State<Add_View> createState() => _Add_ViewState();
}

class _Add_ViewState extends State<Add_View> {
  List<String> coins = [
    "BITCOIN",
    "WAZIRX",
    "USDT",
    "DOT",
  ];
  String dropdownValue = "BITCOIN";
  TextEditingController _amountContoller = TextEditingController();
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
          ],
        ),
      ),
    );
  }
}
