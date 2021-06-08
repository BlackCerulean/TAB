import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_assigning_board/component/bottom_nav.dart';
import 'package:task_assigning_board/screen/Authen.dart';
import 'package:task_assigning_board/component/backgroundRegis.dart';

import '../size_config.dart';

class Profile extends StatelessWidget {
  @override
  var uid = FirebaseAuth.instance.currentUser.uid;
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('TAB Users')
            .doc(uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var profile = snapshot.data.data();
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.fromLTRB(30, 20, 70, 0),
                                      child: Text('Show Profile',
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                            fontSize: 28,
                                          )))),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(30, 0, 70, 0),
                                      child: Text('View your profile here',
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey,
                                            fontSize: 16,
                                          )))),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Image.asset(
                                  'assets/icons/profile-color Vector.jpg',
                                  height: 100,
                                  width: 100,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: defaultSize * 2,
                        ),
                        child: Container(
                          color: Color.fromRGBO(112, 135, 255, 1),
                          height: defaultSize * 0.1,
                          width: defaultSize * 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Icon(
                            Icons.portrait,
                            color: mainColor,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
                            child: Text('Firstname: ',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                        Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: Text(profile['Firstname'],
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                          child: Icon(
                            Icons.portrait,
                            color: mainColor,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(5, 30, 0, 0),
                            child: Text('Lastname: ',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                        Container(
                            margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                            child: Text(profile['Lastname'],
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                      ],
                    ),
                  ],
                ),
                Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                          child: Icon(
                            Icons.business,
                            color: mainColor,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(5, 30, 0, 0),
                            child: Text('Company: ',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                        Container(
                            margin: EdgeInsets.fromLTRB(23, 30, 0, 0),
                            child: Text(profile['Company'],
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                      ],
                    ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Icon(
                        Icons.home_sharp,
                        color: mainColor,
                      ),
                    ),
                    Container(
                            margin: EdgeInsets.fromLTRB(5, 30, 0, 0),
                            child: Text('Address: ',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                    Container(
                        margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
                        child: Text(profile['Address'],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 16,
                            )))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Icon(
                        Icons.call,
                        color: mainColor,
                      ),
                    ),
                    Container(
                            margin: EdgeInsets.fromLTRB(5, 30, 0, 0),
                            child: Text('Contact: ',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                    Container(
                        margin: EdgeInsets.fromLTRB(33, 30, 0, 0),
                        child: Text(profile['Contact'],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 16,
                            )))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                      child: Icon(
                        Icons.mail_sharp,
                        color: mainColor,
                      ),
                    ),
                    Container(
                            margin: EdgeInsets.fromLTRB(5, 30, 0, 0),
                            child: Text('Email: ',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                        child: Text(profile['Email'],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 16,
                            )))),
                  ],
                ),
                // Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
              ],
            ),
          ),
                bottomNavigationBar: MyBottomNavBar(),
          );
        });
  }
}
