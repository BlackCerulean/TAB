import 'package:flutter/material.dart';

const bgColor = Color(0xFFFFFFFF);
const mainColor = Color(0xFF7087FF);

class BackgroundAuthen extends StatelessWidget {
  final Widget child;
  const BackgroundAuthen({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child
        ],
      ),
    );
  }
}