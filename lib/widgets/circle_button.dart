import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
   const CircleButton(
      {Key key,
      @required this.icon,
      @required this.iconSize,
      @required this.onPressed,
      this.color = Colors.black, this.bColor, })
      : super(key: key);

  final IconData icon;
  final double iconSize;
  final Function onPressed;
  final Color color;
  final Color bColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: 40,
      margin: const EdgeInsets.all(4.0),
      decoration:
          BoxDecoration(color: bColor, shape: BoxShape.circle),
      child: IconButton(
        icon: Icon(icon),
        iconSize: iconSize,
        color: color,
        onPressed: onPressed,
      ),
    );
  }
}
