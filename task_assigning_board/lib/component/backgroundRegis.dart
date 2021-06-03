import 'package:flutter/material.dart';

const bgColor = Color(0xFFFFFFFF);
const mainColor = Color(0xFF7087FF);


class BackgroundRegis extends StatelessWidget {
  final Widget child;
  const BackgroundRegis({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child
        ],
      ),
    );
  }
}