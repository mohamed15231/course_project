import 'package:carousel_slider/carousel_slider.dart';
import 'package:course_project/layout/cubit/layout_cubit.dart';
import 'package:course_project/layout/cubit/layout_state.dart';
import 'package:course_project/model/model.dart';
import 'package:course_project/model/placesmodel.dart';
import 'package:course_project/model/slide_model.dart';
import 'package:course_project/modules/places_screen/places_screen.dart';
import 'package:course_project/shared/component/componet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Home_Screen extends StatelessWidget {
  List<ImageModel> images = [
    ImageModel(
        backImage: "assets/images/Backgroundparis.png",
        forwardImage: "assets/images/imageparis.png",
        text: "Paris"),
    ImageModel(
        backImage: "assets/images/Backgroundparis.png",
        forwardImage: "assets/images/indianimage.png",
        text: "Indian"),
    ImageModel(
        backImage: "assets/images/Backgroundparis.png",
        forwardImage: "assets/images/newyork.png",
        text: "New York"),
    ImageModel(
        backImage: "assets/images/Backgroundparis.png",
        forwardImage: "assets/images/losangeles.png",
        text: "Los Angeles"),
  ];

  List<SlideModel> slide = [
    SlideModel(
        leading: "Holidays",
        body: "Say yes to iconic snow Catamount, Hillsdale, New York!",
        tailing: "Book your holiday package today"),
    SlideModel(
        leading: "Holidays",
        body: "Say yes to iconic snow Catamount, Hillsdale, New York!",
        tailing: "Book your holiday package today"),
    SlideModel(
        leading: "Holidays",
        body: "Say yes to iconic snow Catamount, Hillsdale, New York!",
        tailing: "Book your holiday package today"),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var scaffoldKey=GlobalKey();
    var plus=0;
    return BlocConsumer<AppCubit, CubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          key:scaffoldKey ,
            appBar: appBar(context: context, text: "tours", action: [
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              const SizedBox(
                width: 20,
              )
            ]),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Destination",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Color(0xff4458DB)),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      "10 Tours Avialable",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: const Color(0xff111111),
                          ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            defaultListHome(imageModel: images[index]),
                        itemCount: images.length,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      height: 270,
                      width: double.infinity,
                      alignment: AlignmentDirectional.topStart,
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Image.asset(
                            "assets/images/offer.png",
                            fit: BoxFit.fill,
                            height: 200,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 115.0),
                            child: CarouselSlider(
                              items: slide
                                  .map(
                                    (e) => Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.leading!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(fontSize: 12),
                                            ),
                                            const SizedBox(
                                              height: 22,
                                            ),
                                            Align(
                                              child: Text(
                                                e.body!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(fontSize: 15),
                                              ),
                                            ),
                                            const Expanded(
                                              child: SizedBox(),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  e.tailing!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(fontSize: 12),
                                                ),
                                                FloatingActionButton(
                                                  heroTag: "${plus + 1}",
                                                  onPressed: () {},
                                                  mini: true,
                                                  child: const Icon(
                                                    Icons.arrow_forward,
                                                    size: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  aspectRatio: 2,
                                  onPageChanged: (index, e) {
                                    // setState(() {
                                    //   _current = index;
                                    // });
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "Discover New Places",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Color(0xff4458DB)),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                        physics:const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildPlacesScreen(
                            context: context,
                            placesModel: cubit.placesModel!.data!.data![index]),
                        itemCount: cubit.placesModel!.data!.data!.length,
                      ),

                    )

                  ],
                ),
              ),
            ));
      },
    );
  }

  Widget defaultListHome({
    required ImageModel imageModel,
  }) =>
      Stack(
        children: [
          Image(image: AssetImage(imageModel.backImage)),
          Image(image: AssetImage(imageModel.forwardImage)),
          Padding(
            padding: const EdgeInsets.only(top: 64.0, left: 5),
            child: Text(
              imageModel.text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );

  Widget buildPlacesScreen({
    required BuildContext context,
    required Data placesModel,
  }) =>
      InkWell(
        onTap: () {
          print(placesModel.id);
          Navigator.push(context, MaterialPageRoute(builder:(context) =>  PlacesScreen(),));
        },
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                    "http://alcaptin.com${placesModel.image!}",
                    width: 200,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  placesModel.name!,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            Text(
              placesModel.description!,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      );
}
