import 'package:cached_network_image/cached_network_image.dart';
import 'package:career_paths/api/instituteController.dart';
import 'package:career_paths/constants.dart';
import 'package:career_paths/provider/profile_provider.dart';
import 'package:career_paths/screens/home/components/search_field.dart';
import 'package:career_paths/screens/home/components/section_title.dart';
import 'package:career_paths/screens/pages/Institutes/model/institutes_list.dart';
import 'package:career_paths/screens/pages/home/widget/demoInstitutesData.dart';
import 'package:career_paths/screens/pages/home/widget/pop_courses.dart';
import 'package:career_paths/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/Const Api/api_constant.dart';
import '../../../model/institute_model.dart';
import '../../../shimmer effect/skeleton screens/homeTopInstitute.dart';
import '../Institutes/model/detailspage.dart';
import '../quiz/quiz.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _cp_homeScreenState();
}

class _cp_homeScreenState extends State<home> {
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
    //this for the load data everytime
    loadData();
    //call the method for the get name at a page load time
    // getNamePreference().then(updateName);
    // getPhotoPreference().then(updatePhoto);
    super.initState();
  }

  //this line for the load all data in this list for the show data(decoded data institutemodel na class na data jevo)
  List<InstituteModel> institutelist = [];

  //this code for the load all data form the api for the decode the data
  loadData() async {
    var list = await instituteApi.getInstituteList();
    institutelist = list.where((i) => i.topInstitute == "1").toList();
    setState(() {});
  }

  //this for the call api
  final instituteApi = InstituteApi();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Consumer<ProfileProvider>(
                  builder: (context, value, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            greeting(),
                            style: const TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 1.5,
                            ),
                          ),
                          Text(
                            value.name,
                            style: const TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                            //this line for the chek connection no need to every time write only for checking connection
                            // instituteApi.getInstituteList();
                          },
                          child: value.photo == ""
                              ? Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.red,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/no_user.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.red,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
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
                                      placeholder: (context, url) =>
                                          Image.asset(
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
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SearchField(),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: SectionTitle(
                  title: "Trending Courses",
                  press: () {},
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      courses.length,
                      (index) {
                        if (courses[index].isPopular) {
                          return pop_crs(
                            tr_course: courses[index],
                          );
                        }
                        return const SizedBox
                            .shrink(); // here by default width and height is 0
                      },
                    ),
                    // SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ),
              ),

              //for the top_institute
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: SectionTitle(
                  title: "Top Institutes",
                  press: () {},
                ),
              ),

              if (institutelist.isEmpty)
                const SingleChildScrollView(child: skeletonTopInstitute())
              else
                ...institutelist
                    .map((data) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: details(
                                    institutedata: data,
                                  ),
                                  type: PageTransitionType.bottomToTop));
                        },
                        child: demo_data(data: data)))
                    .toList(),

              //fort the quiz suggestions
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const Quiz(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Container(
                    // height: 90,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(15),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF4A3298),
                      // color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Future AID",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.link,
                          color: Colors.white,
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "(personality and apptituted assessment)",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning!';
  }
  if (hour < 17) {
    return 'Good Afternoon!';
  }
  return 'Good Evening!';
}
