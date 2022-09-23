import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_project/layout/cubit/layout_cubit.dart';
import 'package:course_project/layout/cubit/layout_state.dart';
import 'package:course_project/shared/component/componet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlacesScreen extends StatelessWidget {
  PlacesScreen({Key? key}) : super(key: key);
  var scaffoldKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CubitStates>(
      listener: (context, state) {},
      builder: (context, state) {

        return Scaffold(
          key:scaffoldKey ,
          appBar: appBar(
              context: context,
              text: "Places",
              leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xff111111),
                      size: 15,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text("Back",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: const Color(0xff111111)))
                  ],
                ),
              )),
          body: SingleChildScrollView(

            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset("assets/images/backimage.png"),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 1 / 5),
                      child: Text(
                        "Top 10 Favourite \n Destination In Paris",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (context, index, realIndex) =>
                            buildCarouselSlider(url: imageUrl[index]),
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          aspectRatio: 2,
                          autoPlay: false,
                          reverse: false,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                    child: Text(
                  "Disneyland Paris",
                  style: Theme.of(context).textTheme.headline1,
                )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "Departure ",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 20),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "23rd Oct 2017 ",
                            style: Theme.of(context).textTheme.caption,
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "Duration ",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 20),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "5 Days / 4 Nights ",
                            style: Theme.of(context).textTheme.caption,
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "Discover 7 World Heritage Sites in this tour. ",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 20),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "Fans of Mickey can visit Disneyland Paris which is located 32 km from central Paris, with connection to the suburban RER A. ",
                            style: Theme.of(context).textTheme.caption,
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "Disneyland Paris has two theme parks: Disneyland (with Sleeping Beauty's castle) and Walt Disney Studios. Top attractions are Space Mountain, It's a Small World and Big Thunder Mountain. ",
                            style: Theme.of(context).textTheme.caption,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildCarouselSlider({required String url}) {
    return Image.asset(
      url,
      height: 200,
      width: 200,
      fit: BoxFit.fitWidth,
    );
  }

  List<String> imageUrl = [
    "assets/images/image1.png",
    "assets/images/image2.png",
    "assets/images/image1.png",
  ];
}
