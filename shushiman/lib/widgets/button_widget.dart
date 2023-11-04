import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const ButtonWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 82, 108, 85),
            borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.grey[200]),
          ),
        ),
      ),
    );
  }
}
