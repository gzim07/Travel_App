// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "assets/img/welcome-one.png",
    "assets/img/welcome-two.png",
    "assets/img/welcome-three.png"
  ];
  List textPAge = [
    "Incididunt id enim minim sint duis non laborum qui. Eiusmod deserunt officia incididunt fugiat irure eiusmod mollit. Esse commodo qui nostrud consequat consequat incididunt sunt fugiat id cillum ex mollit eiusmod.",
    "Quis et commodo cillum fugiat reprehenderit dolore in. Ad duis sit velit ut duis in. Exercitation minim veniam magna est reprehenderit. Ipsum ipsum aliqua et mollit ut ullamco qui elit reprehenderit reprehenderit laborum minim eiusmod. Qui adipisicing aliqua ex duis et ullamco amet eiusmod in dolore. Voluptate est ut enim nulla veniam pariatur voluptate do nisi quis. Amet aute reprehenderit nisi reprehenderit deserunt esse amet culpa ad id ipsum cupidatat.",
    "Voluptate commodo laboris mollit veniam ipsum magna sint nisi amet cillum velit. Minim dolore quis mollit in minim eu quis nisi nostrud nisi. Labore esse ea enim deserunt minim ipsum ullamco non cillum fugiat labore."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(images[index])),
              ),
              child: Container(
                  margin: EdgeInsets.only(top: 120, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text: "Trips",
                          ),
                          AppText(
                            text: "Mountain",
                            size: 30,
                            color: Colors.black45.withOpacity(.5),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 250,
                            child: AppText(
                              text: textPAge[index],
                              size: 14,
                              color: AppColors.textColor2,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          ResponsiveButton(
                            onPress: () {
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                                color: index == indexDots
                                    ? AppColors.mainColor
                                    : AppColors.mainColor.withOpacity(.3),
                                borderRadius: BorderRadius.circular(8)),
                          );
                        }),
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
