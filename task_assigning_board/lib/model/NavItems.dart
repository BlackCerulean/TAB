import 'package:flutter/material.dart';
import 'package:task_assigning_board/screen/Profile.dart';
import 'package:task_assigning_board/screen/TaskHome/tab_home.dart';
import 'package:task_assigning_board/screen/TaskRequest/task_notify.dart';
import 'package:task_assigning_board/screen/AddTask/AddtaskPage.dart';

class NavItem {
  final int id;
  final String icon;
  final Widget destination;

  NavItem({this.id, this.icon, this.destination});

  //if there is no destination then it help us
  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

// If we made any changes here Provider package rebuild those widget that use this NavItems
class NavItems extends ChangeNotifier {
  // BY default first one is selected
  int selectedIndex = 0;

  void changeNavIndex({int index}) {
    selectedIndex = index;
    // If any changes made it notify widgets that use the value
    notifyListeners();
  }

  // Contain index, icon, and destination(which page we map for them)
  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: "assets/icons/task-white Vector.png",
      destination: TABLanding(),
    ),
    NavItem(
      id: 2,
      icon: "assets/icons/add-task Vector.png",
      destination: AddTaskScreen(),
    ),
    NavItem(
      id: 3,
      icon: "assets/icons/notification Vectior.png",
      destination: TABRequest(),
    ),
    NavItem(
      id: 4,
      icon: "assets/icons/profile Vector.png",
      destination: Profile(),
    ),
  ];
}
