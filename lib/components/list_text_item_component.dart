import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTextItem extends StatelessWidget {
  final String text;
  final Color color;
  Function? action;
  ListTextItem(
      {super.key, required this.text, required this.color, this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (action != null) action!();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
        margin: const EdgeInsets.only(bottom: 7),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(7)),
        child: Text(
          style: const TextStyle(fontSize: 20, color: Colors.white),
          text,
        ),
      ),
    );
  }
}
