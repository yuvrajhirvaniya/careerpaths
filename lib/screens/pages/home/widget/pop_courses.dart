// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:career_paths/screens/pages/Institutes/model/institutes_list.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class pop_crs extends StatelessWidget {
  const pop_crs({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.tr_course,
  }) : super(key: key);

  final double width, aspectRetio;
  final trending_course tr_course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
      child: SizedBox(
        width: getProportionateScreenWidth(140),
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
                return SizedBox(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Container(
                        height: 5,
                        width: 100,
                        decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Text(
                        tr_course.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 19,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: Text(
                                "About Course",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: blackColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Text(
                                tr_course.information,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, bottom: 10, top: 10),
                              child: Text(
                                "Eligibility",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: blackColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Text(
                                "After completing " +
                                    tr_course.qualification +
                                    " standard",
                                textAlign: TextAlign.justify,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ));
              },
            );
          },
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      tr_course.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 42,
                child: Text(
                  tr_course.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
