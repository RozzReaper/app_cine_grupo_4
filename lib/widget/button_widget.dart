import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;
  final Color textColor;

  const ButtonWidget({
    required this.icon,
    required this.text,
    required this.onClicked,
    this.textColor = Colors.black, // Por defecto, el color del texto será negro
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        onPressed: onClicked,
        child: buildContent(),
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 22, color: textColor),
          ),
        ],
      );
}