import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    this.size = 40,
    required this.tooltipText,
  }) : super(key: key);

  final IconData icon;
  final Color backgroundColor;
  final double size;
  final String tooltipText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(size / 2),
        ),
      ),
      child: Tooltip(
        child: Icon(icon),
        message: tooltipText,
      ),
    );
  }
}
