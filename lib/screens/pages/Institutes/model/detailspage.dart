import 'package:career_paths/model/courses_fee_model.dart';
import 'package:career_paths/model/faculty_model.dart';
import 'package:career_paths/model/gallery_model.dart';
import 'package:career_paths/screens/pages/Institutes/components/custom_app_bar.dart';
import 'package:career_paths/screens/pages/Institutes/components/product_images.dart';
import 'package:career_paths/screens/pages/Institutes/components/tab_bar.dart';
import 'package:career_paths/screens/pages/Institutes/model/institutes_list.dart';
import 'package:career_paths/shimmer%20effect/skeleton.dart';
import 'package:career_paths/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../api/instituteController.dart';
import '../../../../constants.dart';
import '../../../../model/institute_model.dart';
import '../../../../model/review/viewReview.dart';
import '../../../../provider/review_provider.dart';
import '../../../../shimmer effect/skeleton screens/skeletondata.dart';
import '../../../details/components/top_rounded_container.dart';

class details extends StatefulWidget {
  final InstituteModel institutedata;
  const details({super.key, required this.institutedata});
  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  final authApi = InstituteApi();
  List<Course> courseList = [];
  List<FacultyModel> facultyList = [];
  List<Gallery> galleryList = [];
  List<ViewReview> viewReviewDataList = [];
  bool isFetchDeta = true;

  load() async {
    courseList = await authApi.getCourseList(widget.institutedata.instituteId);
    facultyList =
        await authApi.getFacultyList(widget.institutedata.instituteId);
    galleryList =
        await authApi.getGalleryList(widget.institutedata.instituteId);
    // viewReviewDataList =
    //     await authApi.getReiviewList(widget.institutedata.instituteId);
    setState(() {
      isFetchDeta = false;
    });
  }

  @override
  void initState() {
    Provider.of<ReviewProvider>(context, listen: false)
        .getReviewList(widget.institutedata.instituteId);
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(rating: widget.institutedata.ratings),
        ),
        body: isFetchDeta
            ? Column(
                children: [
                  Stack(
                    children: const [
                      Skeleton(
                        height: 200,
                      ),
                      Positioned(
                        bottom: 15,
                        left: 20,
                        child: Skeleton(
                          height: 20,
                          width: 70,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 10, right: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 45,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => const Skeleton(
                                  width: 100,
                                ),
                                itemCount: 3,
                                shrinkWrap: true,
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                physics: NeverScrollableScrollPhysics(),
                                child: Column(
                                  children: [
                                    detailSkeleton(),
                                    detailSkeleton(),
                                    detailSkeleton(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  galleryList.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 200,
                            width: SizeConfig.defaultSize,
                            padding: const EdgeInsets.all(16.0 / 2),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 199, 190, 190),
                                  width: 2),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            child: const Center(
                                child: Text(
                              "No image available",
                              style: TextStyle(fontSize: 16),
                            )),
                          ),
                        )
                      : ProductImages(product: galleryList),
                  Expanded(
                    child: TopRoundedContainer(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: getProportionateScreenWidth(10),
                                left: 15,
                                right: 15),
                            child: Text(
                              widget.institutedata.instituteName,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Consumer<ReviewProvider>(
                            builder: (context, value, child) => Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: tab_Bar(
                                  data: widget.institutedata,
                                  courseList: courseList,
                                  facultyList: facultyList,
                                  viewReviewList: value.reviewList,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Padding detailSkeleton() {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: Row(
        children: [
          const CircleSkeleton(size: 80),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Skeleton(),
                SizedBox(height: 16.0 / 2),
                Skeleton(),
                SizedBox(height: 16.0 / 2),
                Skeleton(
                  width: 70,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
