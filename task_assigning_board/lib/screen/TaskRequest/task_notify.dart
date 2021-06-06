import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task_assigning_board/component/bottom_nav.dart';
import 'package:task_assigning_board/screen/TaskRequest/task_card.dart';

class TABRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Task').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }
        return Column(children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Requested Task",
                                style: TextStyle(fontSize: 32),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Text(
                                  "View your task",
                                  style: TextStyle(fontSize: 15),
                                ),
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
                        color: Colors.deepPurpleAccent,
                        height: 2,
                        width: 235,
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Padding(
                        padding:
                            EdgeInsets.fromLTRB(5, 0, 2, 0), // นอน 16 ตั้ง 20
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // mainAxisSpacing: 5,
                            // crossAxisSpacing: 5,
                          ),
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) => TaskCard(
                            index: snapshot.data.docs[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: MyBottomNavBar(),
              ),
            ),
          ),
        ]);
      },
    );
  }
}
