// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;
  AppButtons(
      {Key? key,
      this.isIcon = false,
      this.text = '5',
      this.icon = CupertinoIcons.heart,
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1.0),
            color: backgroundColor,
            borderRadius: BorderRadius.circular(13)),
        child: isIcon == false
            ? Center(
                child: AppText(
                  text: text!,
                  color: color,
                ),
              )
            : Center(
                child: Icon(
                  icon,
                  color: color,
                ),
              ));
  }
}
