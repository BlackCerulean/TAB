import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_assigning_board/screen/TaskDetail/DetailScreen.dart';

class TabCard extends StatelessWidget {
  final DocumentSnapshot index;

  const TabCard({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Task")
          .doc(index.id)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading...');
        }
        var task = snapshot.data.data();
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(
                          taskInfo: index,
                        )));
          },
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * (0.005)), // 15
                    ),
                    elevation: 8,
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  //Task Name
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 8),
                                    child: Text(
                                      task["ProjectName"],
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  //Task Description
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 8),
                                    child: Text(
                                      task["Description"],
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20),
                                    child: Container(
                                      color: Colors.deepPurpleAccent,
                                      height: 1,
                                      width: 120,
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      //Client
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          task["Company"],
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 2.4 * 0.5),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 132,
                top: 135,
                child: Container(
                  child: Image.asset(
                    "assets/icons/${task['Type'] == 'Web Application' ? 'smol web-app vector.png' : task['Type'] == 'Mobile Application' ? 'mobile-app Vector.png' : task['Type'] == 'Graphic Design' ? 'graphic Vector.png' : 'video-edit Vector.png'}",
                    scale: 0.7,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
