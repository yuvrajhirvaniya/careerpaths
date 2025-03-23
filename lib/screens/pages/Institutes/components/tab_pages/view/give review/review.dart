import 'package:career_paths/api/Const%20Api/api_constant.dart';
import 'package:career_paths/provider/review_provider.dart';
import 'package:career_paths/screens/pages/Institutes/components/tab_pages/view/give%20review/writeReview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../constants.dart';
import '../../../../../../../model/review/viewReview.dart';
import '../../../../../../../size_config.dart';

class review_details extends StatefulWidget {
  final String instituteId;
  const review_details({
    super.key,
    required this.data,
    required this.instituteId,
  });
  final List<ViewReview> data;
  @override
  State<review_details> createState() => _review_detailsState();
}

class _review_detailsState extends State<review_details> {
  var userId = "";
  var userName = "";
  var userPhoto = "";
  double rating = 0;

  void getPreference() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("studentId") ?? '';
    userName = prefs.getString("studentName") ?? '';
    userPhoto = prefs.getString("profilePhoto") ?? '';
    setState(() {});
  }

  @override
  void initState() {
    Provider.of<ReviewProvider>(context, listen: false)
        .getReviewList(widget.instituteId);
    getPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewProvider>(
      builder: (context, review, child) => Expanded(
        child: Stack(
          children: [
            review.reviewList.isEmpty
                ? SizedBox(
                    width: SizeConfig.screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "No data available",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kPrimaryColor, fontSize: 16),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ListView.builder(
                      itemCount: review.reviewList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 5.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 199, 190, 190)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 1),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: kTextColor),
                                          borderRadius:
                                              BorderRadius.circular(31)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: FadeInImage(
                                          placeholder: const AssetImage(
                                              'assets/images/no_user.jpg'),
                                          image: NetworkImage(
                                            ApiConstant.reviewPhotoUrl +
                                                review.reviewList[index]
                                                    .profilePhoto,
                                          ),
                                          imageErrorBuilder:
                                              (BuildContext context,
                                                  Object exception,
                                                  StackTrace? stackTrace) {
                                            return Image.asset(
                                              'assets/images/no_user.jpg',
                                              fit: BoxFit.fill,
                                              width: 60,
                                              height: 60,
                                            );
                                          },
                                          fit: BoxFit.cover,
                                          width: 60,
                                          height: 60,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          review.reviewList[index].studentName,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: kTextColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              review.reviewList[index].rating ==
                                                      ""
                                                  ? "1.0"
                                                  : review
                                                      .reviewList[index].rating,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  color: kTextColor),
                                            ),
                                            const SizedBox(width: 5),
                                            SvgPicture.asset(
                                                "assets/icons/Star Icon.svg"),
                                            const SizedBox(width: 10),
                                            Text(
                                              review
                                                  .reviewList[index].reviewDate,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: kTextColor,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                review.reviewList[index].message,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(color: kTextColor),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            Positioned(
              right: 10,
              bottom: 20,
              child: GestureDetector(
                onTap: () {
                  DateTime currentDate = DateTime.now();
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(currentDate);
                  Navigator.push(
                      context,
                      PageTransition(
                          child: writeReview(
                            photo: userPhoto,
                            name: userName,
                            id: userId,
                            instituteId: widget.instituteId,
                            curDate: formattedDate,
                          ),
                          type: PageTransitionType.bottomToTop));
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kPrimaryColor),
                  child: const Icon(
                    Icons.edit_square,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
