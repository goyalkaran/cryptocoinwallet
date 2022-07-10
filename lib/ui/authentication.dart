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
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade400,
      body: Container(
        //fill the screen with max width and height
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              // height: MediaQuery.of(context).size.height / 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  cursorColor: Colors.black12,
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10, left: 10),
                    hintText: "example@email.com",
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontFamily: "BalooBhai",
                      fontSize: 15,
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.orangeAccent,
                    ),
                    // alignLabelWithHint: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              // height: MediaQuery.of(context).size.height / 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: flag,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10, left: 10),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontFamily: "BalooBhai",
                      fontSize: 15,
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.orangeAccent,
                      fontFamily: "BalooBhai",
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 22,
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

                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 35,
                // ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 22,
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
          ],
        ),
      ),
    );
  }
}
