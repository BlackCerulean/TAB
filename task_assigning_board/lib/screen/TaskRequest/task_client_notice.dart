import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_assigning_board/component/bottom_nav.dart';
import 'package:task_assigning_board/component/backgroundRegis.dart';

import '../../size_config.dart';

class FreelanceStatus extends StatelessWidget {
  final String uid;
  final DocumentSnapshot requestDoc;
  final String status;

  const FreelanceStatus({Key key, this.uid, this.requestDoc, this.status})
      : super(key: key);
  @override
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: SvgPicture.asset(
                                "assets/icons/back.svg",
                                color: mainColor,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 40, 40, 0),
                                        child: Text('Show Profile',
                                            style: TextStyle(
                                              fontSize: 32,
                                            ))),
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 7, 40, 20),
                                        child: Text('View your profile here',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            ))),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: Image.asset(
                                    'assets/icons/profile-color Vector.jpg',
                                    scale: 0.9,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      color: Color(0xFF7087FF),
                      height: 2,
                      width: 235,
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
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
                  SizedBox(
                    height: 30,
                  ),
                  //Button
                  status != 'Viewed'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: ElevatedButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('RequestStatus')
                                      .doc(requestDoc.id)
                                      .update({'StatusClient': 'Viewed'});
                                  FirebaseFirestore.instance
                                      .collection('RequestStatus')
                                      .doc(requestDoc.id)
                                      .update({'StatusUser': 'Reject'});
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Reject",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.redAccent,
                                  onPrimary: Colors.white,
                                  elevation: 6,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: ElevatedButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('RequestStatus')
                                      .doc(requestDoc.id)
                                      .update({'StatusClient': 'Viewed'});
                                  FirebaseFirestore.instance
                                      .collection('RequestStatus')
                                      .doc(requestDoc.id)
                                      .update({'StatusUser': 'Approve'});
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Approve",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.greenAccent,
                                  onPrimary: Colors.white,
                                  elevation: 6,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
            bottomNavigationBar: MyBottomNavBar(),
          );
        });
  }
}
