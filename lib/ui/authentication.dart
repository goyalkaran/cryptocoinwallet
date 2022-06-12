import 'package:flutter/material.dart';
import 'package:my_crypto_wallet/net/flutterfire.dart';
import 'home.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //fill the screen with max width and height
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.indigo,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: "Example@email.com",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.orangeAccent,
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.orangeAccent,
                    )),
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
                  bool navigate = await register(
                      _emailController.text, _passwordController.text);
                  if (navigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                },
                child: Text("Register"),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
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
                  bool navigate = await signIn(
                      _emailController.text, _passwordController.text);
                  if (navigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                },
                child: Text("Login"),
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
