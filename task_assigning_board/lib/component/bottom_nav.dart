import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task_assigning_board/model/NavItems.dart';

class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavItems>(
      builder: (context, navItems, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 25), //30
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFF7087FF),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              navItems.items.length,
              (index) => buildIconNavBarItem(
                isActive: navItems.selectedIndex == index ? true : false,
                icon: navItems.items[index].icon,
                press: () {
                  navItems.changeNavIndex(index: index);
                  // maybe destinationChacker is not needed in future because then all of our nav items have destination
                  // But Now if we click those which dont have destination then it shows error
                  // And this fix this problem
                  if (navItems.items[index].destinationChecker())
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => navItems.items[index].destination,
                      ),
                    );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildIconNavBarItem(
      {String icon, Function press, bool isActive = false}) {
    return IconButton(
      icon: Image.asset(
        icon,
        color: isActive ? Colors.white : Color(0xFFD1D4D4),
        height: 50,
      ),
      onPressed: press,
    );
  }
}
