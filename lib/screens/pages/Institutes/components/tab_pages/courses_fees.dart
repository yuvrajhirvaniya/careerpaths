import 'package:career_paths/model/courses_fee_model.dart';
import 'package:career_paths/shimmer%20effect/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../../constants.dart';
import '../../../../../model/gallery_model.dart';
import '../../../../../model/institute_model.dart';
import '../../../../../size_config.dart';
import '../../model/institutes_list.dart';

class courses_fee_details extends StatefulWidget {
  const courses_fee_details({super.key, required this.data});
  final List<Course> data;
  @override
  State<courses_fee_details> createState() => _courses_fee_detailsState();
}

class _courses_fee_detailsState extends State<courses_fee_details> {
  @override
  Widget build(BuildContext context) {
    return widget.data.isEmpty
        ? Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No data available",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kPrimaryColor, fontSize: 16),
                )
              ],
            ),
          )
        : Expanded(
            child: ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: kTextColor.withOpacity(0.6)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.data[index].courseName,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Eligibility: " + widget.data[index].eligiblity,
                              ),
                              Text(
                                "Duration: " + widget.data[index].duration,
                              ),
                              Text(
                                "Rs. ${widget.data[index].fees}/- per year",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
  }
}
