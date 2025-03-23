// ignore_for_file: non_constant_identifier_names

import 'package:career_paths/constants.dart';
import 'package:career_paths/model/courses_fee_model.dart';
import 'package:career_paths/model/faculty_model.dart';
import 'package:career_paths/screens/pages/Institutes/components/tab_pages/courses_fees.dart';
import 'package:career_paths/screens/pages/Institutes/components/tab_pages/cutoff.dart';
import 'package:career_paths/screens/pages/Institutes/components/tab_pages/faculty_profile.dart';
import 'package:career_paths/screens/pages/Institutes/components/tab_pages/information.dart';
import 'package:career_paths/screens/pages/Institutes/components/tab_pages/view/give%20review/review.dart';
import 'package:flutter/material.dart';

import '../../../../model/institute_model.dart';
import '../../../../model/review/viewReview.dart';

class tab_Bar extends StatefulWidget {
  const tab_Bar({
    super.key,
    required this.data,
    required this.courseList,
    required this.facultyList,
    required this.viewReviewList,
  });
  final InstituteModel data;
  final List<Course> courseList;
  final List<FacultyModel> facultyList;
  final List<ViewReview> viewReviewList;
  @override
  State<tab_Bar> createState() => _tab_BarState();
}

class _tab_BarState extends State<tab_Bar> {
  //List off tab bar items
  List<String> items = [
    "Information",
    "CutOff",
    "Faculty",
    "Courses & Fees",
    "Reviews",
  ];

  List tab_pages = [];

  //list off tab bar pages

  int current = 0;

  @override
  void initState() {
    tab_pages = [
      info(product: widget.data),
      cutoff_details(
        data: widget.courseList,
      ),
      faculty_details(
        data: widget.facultyList,
      ),
      courses_fee_details(
        data: widget.courseList,
      ),
      review_details(
        data: widget.viewReviewList,
        instituteId: widget.data.instituteId,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 45,
                      decoration: BoxDecoration(
                        color: current == index
                            ? kPrimaryColor
                            : Color.fromARGB(255, 238, 239, 243),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          items[index],
                          style: TextStyle(
                            color:
                                current == index ? Colors.white : Colors.black,
                            fontWeight: current == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              child: Column(
                children: [
                  tab_pages[current],
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
