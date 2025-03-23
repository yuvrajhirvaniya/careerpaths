// ignore_for_file: use_build_context_synchronously, constant_identifier_names

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:career_paths/api/Const%20Api/api_constant.dart';
import 'package:career_paths/provider/profile_provider.dart';
import 'package:career_paths/screens/pages/favorite/scan_page.dart';
import 'package:career_paths/screens/pages/suggestions_video/video_screen/home_screen.dart';
import 'package:career_paths/screens/pages/widget/profile_widget.dart';
import 'package:career_paths/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/instituteController.dart';
import '../constants.dart';
import '../model/institute_model.dart';
import '../screens/dashboard/About App/Credit/aboutApp.dart';
import '../screens/dashboard/FAQs/faqs.dart';
import '../screens/dashboard/User Profile/view_editProfile.dart';
import '../screens/pages/Institutes/institute.dart';
import '../screens/pages/Institutes/model/institutes_list.dart';
import '../screens/pages/home/home.dart';
import '../screens/pages/quiz/quiz.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
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
            if (_bottomNavIndex == 2)
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return Container();
                      },
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 27),
                    child: Icon(
                      Icons.filter_alt_outlined,
                      color: blackColor,
                      size: 27.0,
                    ),
                  ),
                ),
              ),
            if (_bottomNavIndex != 2)
              const Padding(
                padding: EdgeInsets.only(right: 27),
                child: Icon(
                  Icons.notifications,
                  color: blackColor,
                  size: 30.0,
                ),
              )
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
        // child: Image.asset(
        //   'assets/images/code-scan-two.png',
        //   height: 30.0,
        // ),
        child: const Icon(
          Icons.quiz_outlined,
          size: 30,
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

              final List<InstituteModel> favoritedInstitutes =
                  fav.getFavoritedInsitute();

              favorites = favoritedInstitutes.toSet().toList();
            });
          }),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var usrname = "";
  var photo = "";

  //for the get name
  Future<String> getNamePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    usrname = prefs.getString("studentName")!;
    return usrname;
  }

  //for the get profilePhoto
  Future<String> getPhotoPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    photo = prefs.getString("profilePhoto")!;
    return photo;
  }

  //for the update name real time
  void updateName(String incomingName) {
    setState(() {
      usrname = incomingName;
    });
  }

  //for the update photo real time
  void updatePhoto(String incomingPhoto) {
    setState(() {
      photo = incomingPhoto;
    });
  }

  @override
  initState() {
    Provider.of<ProfileProvider>(context, listen: false).getName();
    Provider.of<ProfileProvider>(context, listen: false).getPhoto();
    //call the method for the get name at a page load time
    getNamePreference().then(updateName);
    getPhotoPreference().then(updatePhoto);
    super.initState();
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
        ),
      ),
      backgroundColor: Colors.white,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Consumer<ProfileProvider>(
              builder: (context, value, child) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kPrimaryColor,
                            width: 4.0,
                          ),
                        ),
                        child: value.photo == ""
                            ? CircleAvatar(
                                radius: 60,
                                backgroundColor: kPrimaryLightColor,
                                backgroundImage:
                                    Image.asset('assets/images/no_user.jpg')
                                        .image,
                              )
                            : SizedBox(
                                height: 143,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(150),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        ApiConstant.profileUrl + value.photo,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Image.asset(
                                      "assets/images/no_user.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      "assets/images/no_user.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            value.name,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 3),
                        //   child: Image.asset(
                        //     "assets/verified.png",
                        //     width: 20,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.grey,
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () async {
                          //Navigator.of(context).pop();
                          await Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const viewProfile(),
                                      type: PageTransitionType.bottomToTop))
                              .then((value) => setState(() {
                                    Provider.of<ProfileProvider>(context,
                                            listen: false)
                                        .getName();
                                    Provider.of<ProfileProvider>(context,
                                            listen: false)
                                        .getPhoto();
                                  }));
                        },
                        child: const ProfileWidget(
                          icon: Icons.person,
                          title: 'My Profile',
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.grey,
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const AboutApp(),
                                  type: PageTransitionType.bottomToTop));
                        },
                        child: const ProfileWidget(
                          icon: Icons.info_outlined,
                          title: 'About App',
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.grey,
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const FAQS(),
                                  type: PageTransitionType.bottomToTop));
                        },
                        child: const ProfileWidget(
                          icon: Icons.chat,
                          title: 'FAQs',
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.grey,
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () {
                          // app link to share
                        },
                        child: const ProfileWidget(
                          icon: Icons.share,
                          title: 'Share',
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.grey,
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () => logout(),
                        child: const ProfileWidget(
                          icon: Icons.logout,
                          title: 'Logout',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
