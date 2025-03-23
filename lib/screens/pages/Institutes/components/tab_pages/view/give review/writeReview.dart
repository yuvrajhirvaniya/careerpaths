// ignore_for_file: camel_case_types
import 'package:cached_network_image/cached_network_image.dart';
import 'package:career_paths/provider/review_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../../../api/Const Api/api_constant.dart';
import '../../../../../../../api/instituteController.dart';
import '../../../../../../../components/default_button.dart';
import '../../../../../../../constants.dart';
import '../../../../../../../size_config.dart';

class writeReview extends StatefulWidget {
  final String photo, name, id, instituteId, curDate;
  const writeReview({
    super.key,
    required this.photo,
    required this.name,
    required this.id,
    required this.instituteId,
    required this.curDate,
  });

  @override
  State<writeReview> createState() => writeReviewState();
}

class writeReviewState extends State<writeReview> {
  bool isLoading = false;
  final GiveReview = InstituteApi();
  double rating = 0;
  final TextEditingController Description = TextEditingController();
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
                    "Give Review",
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
          padding: EdgeInsets.only(top: getProportionateScreenWidth(15)),
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
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 12, right: 10),
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: ApiConstant.profileUrl + widget.photo,
                          imageBuilder: (context, imageProvider) => Container(
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
                          errorWidget: (context, url, error) => Image.asset(
                            "assets/images/no_user.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      widget.name,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 18,
                          color: kTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: RichText(
                      maxLines: null,
                      text: TextSpan(
                        text:
                            'Review are public and include your account info.',
                        style: const TextStyle(
                          color: kTextColor,
                          fontSize: 15,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Learn more',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('object');
                              },
                            style: const TextStyle(
                              color: kTextColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // formGiveReview(
                //   curDate: widget.curDate,
                //   id: widget.id,
                //   instituteId: widget.instituteId,
                // ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  unratedColor: kTextColor,
                  itemCount: 5,
                  itemSize: 35,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 12),
                  updateOnDrag: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: const [
                        Icon(
                          Icons.star_border_outlined,
                          color: kPrimaryColor,
                        ),
                      ],
                    );
                  },
                  onRatingUpdate: (ratingValue) {
                    setState(() {
                      rating = ratingValue;
                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: Description,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r"[']")),
                    ],
                    maxLines: 5,
                    maxLength: 500,
                    cursorColor: kTextColor,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 20, right: 10, top: 20, bottom: 20),
                      enabledBorder: outlineInputBorder(),
                      focusedBorder: outlineInputBorder(),
                      hintText: 'Describe your experience ...',
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Consumer<ReviewProvider>(
                  builder: (context, value, child) => Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 15, right: 15),
                    child: value.isLoading
                        ? SizedBox(
                            width: double.infinity,
                            height: getProportionateScreenHeight(56),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white, shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: kPrimaryColor,
                              ),
                              onPressed: () {},
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : DefaultButton(
                            text: "Submit Review",
                            press: () async {
                              setState(() {
                                isLoading = true;
                              });
                              if (rating == 0 || Description.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Center(
                                      child: Text(
                                        "Please fill up the details",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                await value.giveReview(
                                    widget.instituteId,
                                    widget.id,
                                    rating,
                                    widget.curDate,
                                    context,
                                    Description.text);
                              }
                              setState(() {
                                isLoading = false;
                              });
                            },
                          ),
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
