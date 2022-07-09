// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unused_field, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePagwState();
}

class _HomePagwState extends State<HomePage> with TickerProviderStateMixin {
  var image = {
    "assets/img/balloning.png": "Balloning",
    "assets/img/kayaking.png": "Kayaking",
    "assets/img/hiking.png": "Hiking",
    "assets/img/snorkling.png": "Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.places;
        return Padding(
          padding: const EdgeInsets.only(top: 45, left: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(right: 18),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(.5)),
                    )
                  ]),
            ),
            SizedBox(
              height: 28,
            ),
            AppLargeText(text: "Discover"),
            SizedBox(
              height: 18,
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    labelPadding: EdgeInsets.only(left: 0, right: 40),
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    controller: _tabController,
                    indicator: CircleTabIndicator(
                        color: AppColors.mainColor, radius: 4),
                    tabs: [
                      Tab(text: "Places"),
                      Tab(text: "Inpiration"),
                      Tab(text: "Emotions")
                    ]),
              ),
            ),
            Container(
              height: 300,
              width: double.maxFinite,
              child: TabBarView(controller: _tabController, children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: info.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<AppCubits>(context)
                            .detailPage(info[index]);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15, top: 5),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "http://mark.bslmeiyu.com/uploads/" +
                                        info[index].img))),
                      ),
                    );
                  },
                ),
                Text(""),
                Text(""),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Explore more",
                    size: 22,
                  ),
                  AppText(
                    text: "See All",
                    color: AppColors.textColor1,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: double.maxFinite,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        image.keys.elementAt(index))),
                              )),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            child: AppText(
                              text: image.values.elementAt(index),
                              color: AppColors.textColor2,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ]),
        );
      } else
        return Container();
    }));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius * 5,
        configuration.size!.height - radius * 2);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
