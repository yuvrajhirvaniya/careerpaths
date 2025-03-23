import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:career_paths/provider/favourite_provider.dart';
import 'package:career_paths/screens/pages/Institutes/institute.dart';
import 'package:career_paths/screens/pages/Institutes/model/institutes_list.dart';
import 'package:career_paths/screens/pages/home/home.dart';
import 'package:career_paths/screens/pages/suggestions_video/video_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../api/instituteController.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../constants.dart';
import '../../model/institute_model.dart';
import '../pages/favorite/scan_page.dart';
import 'package:provider/provider.dart';

import '../pages/quiz/quiz.dart';

class DashPage extends StatefulWidget {
  const DashPage({super.key});

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  //this line for the load all data in this list for the show data(decoded data institutemodel na class na data jevo)
  List<InstituteModel> institutelist = [];

  //this code for the load all data form the api for the decode the data
  loadData() async {
    institutelist = await instituteApi.getInstituteList();
    setState(() {});
  }

  //this for the call api
  final instituteApi = InstituteApi();

  //load data
  @override
  initState() {
    Provider.of<Favprovider>(context, listen: false).getFavList();
    super.initState();
    //call the method for the get name at a page load time
    loadData();
  }

  List<InstituteModel> favorites = [];
  int _bottomNavIndex = 0;
  //List of the pages
  List<Widget> _widgetOptions() {
    return [
      const home(),
      const video(),
      InstituteList(institutes: institutelist),
      ScanPage(favoritedInstitutes: favorites),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home_outlined,
    Icons.video_collection_outlined,
    Icons.account_balance_outlined,
    Icons.favorite_border,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Video',
    'Institutes',
    'Favorite',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.sort_rounded,
                color: blackColor,
              )),
        ),
        titleSpacing: -10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: const TextStyle(
                color: blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 27),
              child: Icon(
                Icons.notifications,
                color: blackColor,
                size: 30.0,
              ),
            )
            // if (_bottomNavIndex == 2)
            //   Padding(
            //     padding: const EdgeInsets.only(right: 5),
            //     child: GestureDetector(
            //       onTap: () {
            //         showModalBottomSheet<void>(
            //           context: context,
            //           shape: const RoundedRectangleBorder(
            //             borderRadius: BorderRadius.vertical(
            //               top: Radius.circular(25.0),
            //             ),
            //           ),
            //           builder: (BuildContext context) {
            //             return Container();
            //           },
            //         );
            //       },
            //       child: const Padding(
            //         padding: EdgeInsets.only(right: 27),
            //         child: Icon(
            //           Icons.filter_alt_outlined,
            //           color: blackColor,
            //           size: 27.0,
            //         ),
            //       ),
            //     ),
            //   ),
            // if (_bottomNavIndex != 2)
            //   const Padding(
            //     padding: EdgeInsets.only(right: 27),
            //     child: Icon(
            //       Icons.notifications,
            //       color: blackColor,
            //       size: 30.0,
            //     ),
            //   )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      drawer: const CustomDrawer(),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const Quiz(), type: PageTransitionType.bottomToTop));
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.quiz_outlined,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          elevation: 10,
          splashColor: kPrimaryColor,
          activeColor: kPrimaryColor,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          iconSize: 25,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              final fav = FavInstitute();

              List<InstituteModel> favoritedInstitutes =
                  fav.getFavoritedInsitute();

              favorites = favoritedInstitutes.toSet().toList();
            });
          }),
    );
  }
}
