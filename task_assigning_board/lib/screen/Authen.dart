import 'package:flutter/material.dart';
import 'package:task_assigning_board/component/backgroundAuthen.dart';
import 'Register.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundAuthen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: RichText(
                text: TextSpan(
                  text: "Welcome to",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' TAB',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 65,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    prefixIcon: Icon(Icons.mail_outline, color: mainColor),
                    hintText: 'Your Email',
                    hintStyle: TextStyle(color: Colors.black26),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black26)),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: mainColor,
                  ),
                  hintText: 'Your Password',
                  hintStyle: TextStyle(color: Colors.black26),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black26),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()
                   )
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 40.0,
                  width: 100.0,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    color: mainColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(2, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Sign in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()))
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign up!',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
