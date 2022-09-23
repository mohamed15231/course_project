import 'package:course_project/layout/cubit/layout_cubit.dart';
import 'package:course_project/layout/cubit/layout_state.dart';
import 'package:course_project/shared/component/componet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LayoutScreen extends StatelessWidget {
  LayoutScreen({Key? key}) : super(key: key);
  List<String> layoutModel = [
    "assets/images/usa_newyork.png",
    "assets/images/france_location.png",
    "assets/images/india.png",
    "assets/images/england.png",
    "assets/images/australia.png",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getPlacesData(),
      child: BlocConsumer<AppCubit, CubitStates>(
        listener: (BuildContext context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar:
            cubit.currentIndex==0||cubit.currentIndex==4? null : appBar(context: context, text: cubit.title[cubit.currentIndex]),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color(0xffF6F6F6),
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                cubit.changeScree(value);
              },
              items:cubit.items,
            ),
          );
        },
      ),
    );
  }

  Widget buildScreenLocation({
    required String url,
  }) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          url,
          height: 150,
        ),
      ],
    );
  }
}
