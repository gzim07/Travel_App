import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';

class AppLargeText extends StatelessWidget {
  final int size;
  final Color color;
  final String text;

  const AppLargeText(
      {Key? key, required this.text, this.color = Colors.black, this.size = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: size.toDouble(),
      ),
    );
  }
}
