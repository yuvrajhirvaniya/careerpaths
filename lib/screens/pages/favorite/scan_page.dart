import 'package:career_paths/constants.dart';
import 'package:career_paths/model/institute_model.dart';
import 'package:career_paths/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../Institutes/model/detailspage.dart';
import '../Institutes/model/institutes_list.dart';
import '../home/widget/demoInstitutesData.dart';

class ScanPage extends StatefulWidget {
  final List<InstituteModel> favoritedInstitutes;
  const ScanPage({Key? key, required this.favoritedInstitutes})
      : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Favprovider>(
      builder: (context, value, child) =>
          NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: Scaffold(
          body: value.favList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Image.asset('assets/images/fav.png'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Your Favorited Institutes',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          ...value.favList.map(
                            (e) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        child: details(
                                          institutedata: e,
                                        ),
                                        type: PageTransitionType.bottomToTop),
                                  );
                                },
                                child: Dismissible(
                                  key: Key(e.instituteId),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction) {
                                    value.removeModel(e);
                                  },
                                  background: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFE6E6),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        SvgPicture.asset(
                                            "assets/icons/Trash.svg"),
                                      ],
                                    ),
                                  ),
                                  child: demo_data(
                                    data: e,
                                  ),
                                ),
                              );
                              // here by default width and height is 0
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
