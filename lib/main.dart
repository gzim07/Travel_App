// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit.dart';
import 'package:flutter_cubit/cubit/app_cubit_logics.dart';
import 'package:flutter_cubit/services/data_services.dart';

import 'pages/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: BlocProvider<AppCubits>(
          create: (_) {
            return AppCubits(data: DataServices());
          },
          child: AppCubitLogics(),
        ));
  }
}
