import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailInformation extends StatefulWidget {
  final DocumentSnapshot taskDB;

  DetailInformation({Key key, this.taskDB}) : super(key: key);
  @override
  _DetailInformationState createState() => _DetailInformationState();
}

class _DetailInformationState extends State<DetailInformation> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Task')
            .doc('G0H1vswtAJtcTZTlxWXI')
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Text('CompanyName: ' + task['Company'],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 16,
                            )))),
                    Container(
                        child: Text('ClientName: ' + task['Client'],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontSize: 16,
                            )))),
                  ],
                ),
                Row(
                  children: [
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
                    margin: EdgeInsets.all(10),
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
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text(task['Rewards'],
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 16,
                        )))),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text(task['Address'],
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 16,
                        )))),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text(task['CompanyNumber'],
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 16,
                        )))),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text(task['CompanyMail'],
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontSize: 16,
                        )))),
              ],
            ),
          ));
        });
  }
}
