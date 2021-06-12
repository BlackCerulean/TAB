import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_assigning_board/screen/Authen.dart';
import 'package:task_assigning_board/component/backgroundRegis.dart';

import '../../size_config.dart';

class RequestInfo extends StatefulWidget {
  final DocumentReference taskDB;

  RequestInfo({Key key, this.taskDB}) : super(key: key);
  @override
  _RequestInfoState createState() => _RequestInfoState();
}

class _RequestInfoState extends State<RequestInfo> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return StreamBuilder<DocumentSnapshot>(
        stream: widget.taskDB.snapshots(),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
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
                          if (task['Type'] == 'Web Application')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 20, 0, 0),
                                        child: Text('Web Application',
                                            style: TextStyle(
                                              fontSize: 28,
                                            ))),
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 7, 140, 20),
                                        child: Text('Task detail',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                            ))),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  child: Image.asset(
                                    'assets/icons/web-app vector.jpg',
                                    scale: 0.7,
                                  ),
                                )
                              ],
                            ),
                          if (task['Type'] == 'Video Editing')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 20, 0, 0),
                                        child: Text('Video Editing',
                                            style: TextStyle(
                                              fontSize: 28,
                                            ))),
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 7, 140, 20),
                                        child: Text('Task detail',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                            ))),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  child: Image.asset(
                                    'assets/icons/video-edit Vector.jpg',
                                    scale: 0.7,
                                  ),
                                )
                              ],
                            ),
                          if (task['Type'] == 'Graphic Design')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 20, 0, 0),
                                        child: Text('Computer Graphic',
                                            style: TextStyle(
                                              fontSize: 28,
                                            ))),
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 7, 140, 20),
                                        child: Text('Task detail',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                            ))),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  child: Image.asset(
                                    'assets/icons/graphic Vector.jpg',
                                    scale: 0.7,
                                  ),
                                )
                              ],
                            ),
                          if (task['Type'] == 'Mobile Application')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 20, 0, 0),
                                        child: Text('Mobile Application',
                                            style: TextStyle(
                                              fontSize: 28,
                                            ))),
                                    Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 7, 140, 20),
                                        child: Text('Task detail',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                            ))),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  child: Image.asset(
                                    'assets/icons/mobile-app Vector.jpg',
                                    scale: 0.7,
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
                    width: 365,
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
