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

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
    var uid = FirebaseAuth.instance.currentUser.uid;
    DocumentReference users = FirebaseFirestore.instance.collection("TAB Users").doc(uid);
    users.set({
      'UserID': uid,
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
    return Form(
      key: _formkey,
          child: Scaffold(
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
                child: TextFormField(
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
                  validator: (value) {
                    if (value.isNotEmpty)  {
                      return null;
                    } else if (value.isNotEmpty && value.length < 11){
                      return 'Your Email is too short';
                    } else {
                      return 'Please enter your Email';
                    }
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
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
                  validator: (value) {
                    if  (value.isNotEmpty){
                      return null;
                    } else if (value.isNotEmpty && value.length < 3){
                      return 'Your name is too short';
                    } else {
                      return 'Please give us your name';
                    }
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
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
                  validator: (value) {
                    if (value.isNotEmpty){
                      return null;
                    } else if (value.isNotEmpty && value.length < 3){
                     return 'Your lastname is too short';
                    } else {
                       return 'Please give us your lastname';
                    }
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
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
                  validator: (value) {
                    if (value.isNotEmpty && value.length < 6) {
                      return 'Your password is too short';
                    } else if (value.isEmpty) {
                      return 'Please give us your password';
                    }
                  },
                    obscuringCharacter: '*',
                    obscureText: true,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please give us your Company name';
                    } 
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Fill - if you want to skip this field';
                    } 
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please give us your contact';
                    } 
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please give us some of your profile';
                    } 
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () async {
                    if (!_formkey.currentState.validate()) {
                      return;
                    }
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
      ),
    );
  }
}
