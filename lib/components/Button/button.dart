import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    Key? key,
    this.color = Colors.blue,
    this.isDisabled = false,
    VoidCallback? onPressed,
    this.borderRadius = 6.0,
    required this.text,
  }) : super(key: key) {
    this.onPressed = onPressed ?? () {};
  }

  final Color color;
  final bool isDisabled;
  late final VoidCallback onPressed;
  final double borderRadius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isDisabled ? null : onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return color.withOpacity(0.4);
          }
          return color;
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
      ),
    );
  }
}
