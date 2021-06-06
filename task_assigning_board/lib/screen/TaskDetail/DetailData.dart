import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_assigning_board/screen/Authen.dart';
import 'package:task_assigning_board/component/backgroundRegis.dart';

import '../../size_config.dart';

class DetailInformation extends StatefulWidget {
  final DocumentSnapshot taskDB;

  DetailInformation({Key key, this.taskDB}) : super(key: key);
  @override
  _DetailInformationState createState() => _DetailInformationState();
}

class _DetailInformationState extends State<DetailInformation> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Task')
            .doc('g5W98MfrYUtzfdccWsmw')
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var task = snapshot.data.data();
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          if (task['Type'] == 'Web')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 20, 0, 0),
                                        child: Text('Web Application',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                              fontSize: 28,
                                            )))),
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 140, 0),
                                        child: Text('Task detail',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey,
                                              fontSize: 16,
                                            )))),
                                  ],
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/icons/web-app vector.jpg',
                                    height: 100,
                                    width: 100,
                                  ),
                                )
                              ],
                            ),
                          if (task['Type'] == 'Video')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 20, 0, 0),
                                        child: Text('Video',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                              fontSize: 28,
                                            )))),
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 140, 0),
                                        child: Text('Task detail',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey,
                                              fontSize: 16,
                                            )))),
                                  ],
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/icons/video-edit Vector.jpg',
                                    height: 100,
                                    width: 100,
                                  ),
                                )
                              ],
                            ),
                          if (task['Type'] == 'Graphic')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 20, 0, 0),
                                        child: Text('Computer Graphic',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                              fontSize: 28,
                                            )))),
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 140, 0),
                                        child: Text('Task detail',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey,
                                              fontSize: 16,
                                            )))),
                                  ],
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/icons/graphic Vector.jpg',
                                    height: 100,
                                    width: 100,
                                  ),
                                )
                              ],
                            ),
                          if (task['Type'] == 'Mobile')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 20, 0, 0),
                                        child: Text('Mobile Application',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                              fontSize: 28,
                                            )))),
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 140, 0),
                                        child: Text('Task detail',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey,
                                              fontSize: 16,
                                            )))),
                                  ],
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/icons/mobile-app Vector.jpg',
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
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text(task['ProjectName'],
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 24,
                        )))),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                              child: Text(task['Description'],
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ))))
                        ])),
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
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Icon(
                            Icons.business_outlined,
                            color: mainColor,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text('Company: ',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                        Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(task['Company'],
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
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Icon(
                            Icons.portrait,
                            color: mainColor,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text('Client: ',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                        Container(
                            margin: EdgeInsets.fromLTRB(45, 0, 0, 0),
                            child: Text(task['Client'],
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                )))),
                      ],
                    ),
                  ],
                ),
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
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Icon(
                        Icons.dehaze,
                        color: mainColor,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Text('Requirment',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 24,
                            )))),
                  ],
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                              child: Text(task['Requirement'],
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ))))
                        ])),
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
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Image.asset(
                        'assets/icons/wages.jpg',
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Text(task['Rewards'],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 16,
                            )))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(17, 20, 0, 0),
                      child: Icon(
                        Icons.home_sharp,
                        color: mainColor,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(task['Address'],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 16,
                            )))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(17, 20, 0, 0),
                      child: Icon(
                        Icons.call,
                        color: mainColor,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(task['CompanyNumber'],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 16,
                            )))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(17, 20, 0, 0),
                      child: Icon(
                        Icons.mail_sharp,
                        color: mainColor,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(task['CompanyMail'],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 16,
                            )))),
                  ],
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
              ],
            ),
          ));
        });
  }
}
