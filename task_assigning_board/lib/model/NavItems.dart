import 'package:flutter/material.dart';

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
      icon: "assets/icons/home.svg",
      // destination: HomeScreen(),
    ),
    NavItem(
      id: 2,
      icon: "assets/icons/heart.svg",
      // destination: favouritePage(),
    ),
    NavItem(
      id: 3,
      icon: "assets/icons/library_add.svg",
      // destination: AddRecipe(),
    ),
    NavItem(
      id: 4,
      icon: "assets/icons/pot.svg",
      // destination: equipPage(),
    ),
    NavItem(
      id: 5,
      icon: "assets/icons/user.svg",
      // destination: ProfileScreen(),
    ),
  ];
}
