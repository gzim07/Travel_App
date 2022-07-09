import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final int size;
  final Color color;
  final String text;

  const AppText(
      {Key? key,
      required this.text,
      this.color = Colors.black54,
      this.size = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size.toDouble(),
      ),
    );
  }
}
