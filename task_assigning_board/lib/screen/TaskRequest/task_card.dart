import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final DocumentSnapshot index;

  const TaskCard({Key key, this.index}) : super(key: key);
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
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => RecipeScreen(
            //                 recipeIndex: snapshot.data,
            //               )));
          },
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * (0.005)), // 15
                    ),
                    elevation: 10,
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
              // Positioned(
              //   left: 62,
              //   top: 0,
              //   child: Container(
              //     child: CircleAvatar(
              //       backgroundImage: NetworkImage("image"),
              //       backgroundColor: Colors.transparent,
              //       radius: 58.0,
              //     ),
              //     decoration: new BoxDecoration(
              //         shape: BoxShape.circle,
              //         border: new Border.all(
              //           // color: kPrimaryColor,
              //           width: 4.5,
              //         )),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
