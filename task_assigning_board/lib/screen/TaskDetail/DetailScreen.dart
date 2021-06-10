import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_assigning_board/component/bottom_nav.dart';
import 'package:task_assigning_board/screen/TaskDetail/DetailData.dart';

class DetailScreen extends StatelessWidget {
  final DocumentSnapshot taskInfo;

  const DetailScreen({Key key, this.taskInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailInformation(
        taskDB: taskInfo,
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
