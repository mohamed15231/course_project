import 'package:bloc/bloc.dart';
import 'package:course_project/layout/cubit/layout_state.dart';
import 'package:course_project/modules/calender/calender.dart';
import 'package:course_project/modules/favorite/favorite.dart';
import 'package:course_project/modules/home/home.dart';
import 'package:course_project/modules/location/location.dart';
import 'package:course_project/modules/person/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<CubitStates>{
  AppCubit():super(CubitInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  int currentIndex=2;
  void changeScree(int index){
    currentIndex=index;
    emit(CubitChangeBottomNavState());
  }
  List<Widget> screen=[
    Home_Screen(),
    const FavoriteScreen(),
    Location_Screen(),
    const CalenderScreen(),
    const PersonScreen(),
  ];

  List<String> title=[
    "Tour",
    "favorite",
    "location",
    "calender",
    "person",
  ];

}