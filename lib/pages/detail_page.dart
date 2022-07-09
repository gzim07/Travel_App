// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_buttons.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';
import 'package:flutter_svg/svg.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: ((context, state) {
      DetailState detailState = state as DetailState;

      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("http://mark.bslmeiyu.com/uploads/" +
                          detailState.places.img),
                    )),
                  )),
              Positioned(
                  left: 20,
                  top: 50,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/svg/musical-sign-of-two-dots-svgrepo-com.svg",
                          color: Colors.white,
                          height: 18,
                          width: 18,
                        ),
                      )
                    ],
                  )),
              Positioned(
                  top: 270,
                  child: Container(
                      height: MediaQuery.of(context).size.height - 270,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: detailState.places.name,
                                size: 28,
                                color: Colors.black.withOpacity(.8),
                              ),
                              AppLargeText(
                                text:
                                    "\$ " + detailState.places.price.toString(),
                                size: 28,
                                color: AppColors.mainColor,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                detailState.places.location,
                                style: TextStyle(color: AppColors.textColor1),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < detailState.places.stars
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  );
                                }),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              AppText(
                                text: detailState.places.stars.toString(),
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(.8),
                            size: 20,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: "Number of people in your group",
                            color: AppColors.mainTextColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: AppButtons(
                                            isIcon: false,
                                            text: "${index + 1}",
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                            backgroundColor: selectedIndex ==
                                                    index
                                                ? Colors.black
                                                : AppColors.buttonBackground,
                                            size: 50,
                                            borderColor: selectedIndex == index
                                                ? Colors.black
                                                : AppColors.buttonBackground),
                                      ),
                                    )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(.8),
                            size: 20,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: detailState.places.description,
                            color: AppColors.mainTextColor,
                          )
                        ],
                      ))),
              Positioned(
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                          isIcon: true,
                          color: AppColors.textColor1,
                          backgroundColor: Colors.white,
                          size: 60,
                          borderColor: AppColors.textColor1),
                      SizedBox(
                        width: 15,
                      ),
                      ResponsiveButton(
                        onPress: () {},
                        isResponsive: true,
                      )
                    ],
                  )),
            ],
          ),
        ),
      );
    }));
  }
}
