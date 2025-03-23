// ignore_for_file: non_constant_identifier_names

import 'package:career_paths/screens/home/components/search_field.dart';
import 'package:career_paths/screens/pages/Institutes/model/InstituteDesign.dart';
import 'package:career_paths/shimmer%20effect/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../../model/institute_model.dart';
import '../../../provider/favourite_provider.dart';
import 'model/detailspage.dart';

// import '../../../api/instituteController.dart';
// import '../../../model/institute_model.dart';

class InstituteList extends StatefulWidget {
  final List<InstituteModel> institutes;
  // List<Institute> _instituteList = Institute.institutes;

  const InstituteList({super.key, required this.institutes});

  @override
  State<InstituteList> createState() => _InstituteListState();
}

class _InstituteListState extends State<InstituteList> {
  double screenwidth = 0;
  double screenhigth = 0;

  @override
  void initState() {
    Provider.of<Favprovider>(context, listen: false).getFavList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenhigth = MediaQuery.of(context).size.height;
    return Consumer<Favprovider>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: value.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Column(
                children: [
                  const SearchField(),
                  const SizedBox(
                    height: 5,
                  ),
                  NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowIndicator();
                      return true;
                    },
                    child: Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            //fort the show data in gui
                            if (widget.institutes.isEmpty)
                              Column(
                                children: [
                                  SkeletonBuild(),
                                  SkeletonBuild(),
                                  SkeletonBuild(),
                                ],
                              )
                            else
                              ...widget.institutes
                                  .map((data) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: details(
                                                  institutedata: data,
                                                ),
                                                type: PageTransitionType
                                                    .bottomToTop));
                                      },
                                      child: InstititueDesign(data: data)))
                                  .toList(),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Padding SkeletonBuild() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Skeleton(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
            child: Row(
              children: [
                const CircleSkeleton(size: 50),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Skeleton(),
                      SizedBox(height: 16.0 / 2),
                      Skeleton(width: 150),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
