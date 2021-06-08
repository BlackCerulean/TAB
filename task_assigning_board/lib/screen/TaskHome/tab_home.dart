import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_assigning_board/component/bottom_nav.dart';
import 'package:task_assigning_board/screen/TaskHome/tab_card.dart';

class TABLanding extends StatelessWidget {
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
                                "Assining Board",
                                style: TextStyle(fontSize: 32),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Text(
                                  "Find your task here",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 50),
                          Image.asset(
                            'assets/icons/task Vector.png',
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
                    Flexible(
                      flex: 5,
                      child: Padding(
                        padding:
                            EdgeInsets.fromLTRB(0, 0, 0, 0), // นอน 16 ตั้ง 20
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // mainAxisSpacing: 5,
                            // crossAxisSpacing: 5,
                          ),
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) => TabCard(
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
