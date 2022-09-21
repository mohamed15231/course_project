import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF6F6F6),
        elevation: 0,
        leading: Image.asset("assets/icons/leadingicon.png"),
        title: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15),
          child: Text(
            "location".toUpperCase(),
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xffF6F6F6),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildScreenLocation(url: layoutModel[index]),
          itemCount: layoutModel.length,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:const Color(0xffF6F6F6) ,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/home.png"), label: ""),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/fav.png"), label: ""),
          BottomNavigationBarItem(
              icon: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset("assets/icons/location.png"),
                  Image.asset("assets/icons/bag.png"),
                ],
              ), label: ""),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/calendar.png"),
            label: ""
          ),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/avatar.png"), label: ""),
        ],
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
