import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../AboutAppStructure.dart';
import '../Privacy and Policy/privacyPolicy.dart';
import '../Terms and Conditions/termsConditions.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6F9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(40),
                    width: getProportionateScreenWidth(40),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        foregroundColor: kPrimaryColor,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        "assets/icons/Back ICon.svg",
                        height: 15,
                      ),
                    ),
                  ),
                  const Text(
                    "About App",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(40),
                    width: getProportionateScreenWidth(40),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: getProportionateScreenWidth(15)),
          padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
          width: double.infinity,
          height: SizeConfig.screenHeight,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xffDDDDDD),
                blurRadius: 1.0,
                offset: Offset(0.0, 0.0),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                pages(
                    text: "Credit",
                    iconData: Icons.person_outline_outlined,
                    press: () {
                      showDialog(
                        barrierColor: Colors.black.withOpacity(0.67),
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification: (overScroll) {
                            overScroll.disallowIndicator();
                            return true;
                          },
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            content: StatefulBuilder(
                              builder: (context, setState) =>
                                  SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "Application Version:",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const Text(
                                      "v1.0.0",
                                      style: TextStyle(
                                        color: kTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            getProportionateScreenHeight(30)),
                                    const Text(
                                      "Developed By:",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const Text(
                                      "Yuvraj Hirvaniya",
                                      style: TextStyle(
                                        color: kTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "Jaydeep Satani",
                                      style: TextStyle(
                                        color: kTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                pages(
                  text: "Terms & Conditions",
                  iconData: Icons.privacy_tip_outlined,
                  press: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: termCondition(),
                            type: PageTransitionType.bottomToTop));
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                pages(
                  text: "Privacy & Policy",
                  iconData: Icons.lock_person_outlined,
                  press: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: privacyPolicy(),
                            type: PageTransitionType.bottomToTop));
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
