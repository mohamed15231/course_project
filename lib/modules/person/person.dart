import 'package:course_project/layout/cubit/layout_cubit.dart';
import 'package:course_project/layout/cubit/layout_state.dart';
import 'package:course_project/modules/login_screen/login_screen.dart';
import 'package:course_project/shared/component/componet.dart';
import 'package:course_project/shared/constant/constant.dart';
import 'package:course_project/shared/network/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CubitStates>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: appBar(
              context: context,
              text: "Person",
              action: [Image.asset("assets/images/iconcancel.png")]),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage("assets/images/profileImage.png")),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Kenneth Gutierrez",
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Kenneth_gutierrez@gmail.com",
                  style: Theme.of(context).textTheme.caption,
                ),
                buildPersonScreen(context: context, leading: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ), text: "Notification"),
                buildPersonScreen(context: context, leading: CircleAvatar(
                  radius: 15,
                  backgroundColor: Color(0xff58C7FB),
                  child: Image.asset("assets/icons/plane.png")
                ), text: "Tours"),
                buildPersonScreen(context: context, leading: CircleAvatar(
                  radius: 15,
                  backgroundColor: const Color(0xffDC58FB),
                  child: Image.asset("assets/icons/path.png"),
                ), text: "Location"),
                buildPersonScreen(context: context, leading: const CircleAvatar(
                  radius: 15,
                  backgroundColor:  Color(0xff5252D8),
                  child: Icon(
                    Icons.sports_basketball,
                    color:Colors.white
                  ),
                ), text: "Language"),
                buildPersonScreen(context: context, leading: const CircleAvatar(
                  radius: 15,
                  backgroundColor:  Color(0xff3075F9),
                  child: Icon(
                    Icons.people,
                    color:Colors.white
                  ),
                ), text: "Invite Friends"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                buildPersonScreen(context: context, leading:  CircleAvatar(
                  radius: 15,
                  backgroundColor:  Color(0xffF9CA1C),
                  child: Image.asset(
                    "assets/icons/iconcenter.png"
                  )
                ), text: "Help Center"),
                buildPersonScreen(context: context, leading:  CircleAvatar(
                  radius: 15,
                  backgroundColor:  Color(0xff4AD76D),
                  child: Image.asset(
                    "assets/icons/setings.png"
                  )
                ), text: "Setting"),
                InkWell(
                  onTap: () {
                    CacheHelper.removeData(key: Constant.tokenKey).then((value) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const LoginScreen(),));
                    });
                  },
                  child: buildPersonScreen(context: context, leading:  CircleAvatar(
                    radius: 15,
                    backgroundColor:  Color(0xff9A9A9A),
                    child: Image.asset(
                     "assets/icons/logout.png"
                    )
                  ), text: "Log Out"),
                ),

              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
  Widget buildPersonScreen({
  required BuildContext context,
  required Widget leading,
  required String text,
}){
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children:  [
           leading,
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 19,
                fontFamily: Constant.boldText
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_rounded,
            color: Color(0xff111111),
            size: 18,
          )
        ],
      ),
    );
  }
}
