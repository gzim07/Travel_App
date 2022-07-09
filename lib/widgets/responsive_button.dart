// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  void Function() onPress;
  ResponsiveButton(
      {Key? key,
      this.isResponsive = false,
      this.width = 100,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width: isResponsive == true ? double.maxFinite : width,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.mainColor),
          child: Row(
              mainAxisAlignment: isResponsive == false
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceAround,
              children: [
                (isResponsive == true)
                    ? AppText(
                        text: "Book Trip Now",
                        color: Colors.white,
                      )
                    : Container(),
                Image.asset(
                  "assets/img/button-one.png",
                )
              ]),
        ),
      ),
    );
  }
}
