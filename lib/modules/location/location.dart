import 'package:course_project/shared/component/componet.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Location_Screen extends StatelessWidget {
  Location_Screen({Key? key}) : super(key: key);
  List<String> layoutModel = [
    "assets/images/usa_newyork.png",
    "assets/images/france_location.png",
    "assets/images/india.png",
    "assets/images/england.png",
    "assets/images/australia.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF6F6F6),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            buildScreenLocation(url: layoutModel[index]),
        itemCount: layoutModel.length,
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
