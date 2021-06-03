import 'package:flutter/material.dart';
import 'package:task_assigning_board/component/backgroundRegis.dart';
import 'Authen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  final companyController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  final urlController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    fnameController.dispose();
    lnameController.dispose();
    passwordController.dispose();
    cpasswordController.dispose();
    companyController.dispose();
    addressController.dispose();
    contactController.dispose();
    urlController.dispose();
    super.dispose();
  }

  Future<void> saveUserData(String displayName) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('TAB Users');
    users.add({
      'Email': emailController.text,
      'Firstname': fnameController.text,
      'Lastname': lnameController.text,
      'Password': passwordController.text,
      'Company': companyController.text,
      'Address': addressController.text,
      'Contact': contactController.text,
      'URL': urlController.text,
    }).then((response) {
      print('Add Success');
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title = $title, message = $message');
    });
    return;
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundRegis(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.12),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: RichText(
                text: TextSpan(
                  text: "Register with",
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
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  prefixIcon: Icon(
                    Icons.mail_outline_outlined,
                    color: mainColor,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black26),
                  hintText: 'Your Email Address ',
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: fnameController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  prefixIcon: Icon(
                    Icons.portrait,
                    color: mainColor,
                  ),
                  labelText: "Firstname",
                  labelStyle: TextStyle(color: Colors.black26),
                  hintText: 'Your Firstname ',
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: lnameController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  prefixIcon: Icon(
                    Icons.portrait,
                    color: mainColor,
                  ),
                  labelText: "Lastname",
                  labelStyle: TextStyle(color: Colors.black26),
                  hintText: 'Your Lastname',
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: mainColor,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black26),
                  hintText: 'Your Password',
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: cpasswordController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: mainColor,
                  ),
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(color: Colors.black26),
                  hintText: 'Your Password',
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: companyController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  prefixIcon: Icon(
                    Icons.business_outlined,
                    color: mainColor,
                  ),
                  labelText: "Company",
                  labelStyle: TextStyle(color: Colors.black26),
                  hintText: 'Company Address',
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  prefixIcon: Icon(
                    Icons.home_outlined,
                    color: mainColor,
                  ),
                  labelText: "Address",
                  labelStyle: TextStyle(color: Colors.black26),
                  hintText: 'Your Company Address',
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: contactController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: mainColor,
                  ),
                  labelText: "Contact",
                  labelStyle: TextStyle(color: Colors.black26),
                  hintText: 'Your Phone.no',
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: urlController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  prefixIcon: Icon(
                    Icons.link,
                    color: mainColor,
                  ),
                  labelText: "URL Profile",
                  labelStyle: TextStyle(color: Colors.black26),
                  hintText: 'Your URL Profile ( Websites, facebook, etc )',
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 14),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () async {
                  try {
                    await Firebase.initializeApp();
                    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                    await firebaseAuth
                        .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                        .then((response) {
                      print('Register Success');
                    }).catchError((response) {
                      String title = response.code;
                      String message = response.message;
                      print('title = $title, message = $message');
                    });
                    User updateUser = FirebaseAuth.instance.currentUser;
                    updateUser.updateProfile(displayName: emailController.text);
                    saveUserData(emailController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  } catch (e) {
                    print(e.toString());
                  }
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
                    "SIGN UP",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()))
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign in!',
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
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
