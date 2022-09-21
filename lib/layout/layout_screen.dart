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
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, CubitStates>(
        listener: (BuildContext context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar:
                appBar(context: context, text: cubit.title[cubit.currentIndex]),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color(0xffF6F6F6),
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                cubit.changeScree(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/home.png"),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/fav.png"),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset("assets/icons/location.png"),
                      Image.asset("assets/icons/bag.png"),
                    ],
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/calendar.png"),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("assets/icons/avatar.png"),
                  label: "",
                ),
              ],
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
