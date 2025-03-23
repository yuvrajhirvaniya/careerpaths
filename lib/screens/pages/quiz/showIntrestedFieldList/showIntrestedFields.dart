// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../api/Const Api/api_constant.dart';
import '../../../../api/api.dart';
import '../../../../api/model/intrestedFieldListModel.dart';
import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../giveQuiz/giveQuizWeb.dart';

class FieldList extends StatefulWidget {
  final List<IntrestedFieldList> Fileds;
  const FieldList({
    super.key,
    required this.Fileds,
  });

  @override
  State<FieldList> createState() => _FieldListState();
}

class _FieldListState extends State<FieldList> {
  bool isLoading = false;
  final api = quizApi();
  List<String>? brandTital = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            ...widget.Fileds.map(
              (data) {
                bool isSelected = false;
                if (brandTital!.contains(data.courseName)) {
                  isSelected = true;
                }
                return GestureDetector(
                  onTap: () {
                    if (!brandTital!.contains(data.courseName)) {
                      brandTital!.add(data.courseName);
                      setState(() {});
                      print(brandTital);
                    } else {
                      brandTital!
                          .removeWhere((element) => element == data.courseName);
                      setState(() {});
                      print(brandTital);
                    }
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Container(
                          width: 150,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: isSelected
                                ? kPrimaryColor
                                : Colors.grey.shade100,
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                data.courseName,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -50,
                        child: Container(
                          width: 120,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 5,
                              // color: Color(0xFFFF7643),
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey.shade100,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: CachedNetworkImage(
                              imageUrl: ApiConstant.intrestedFieldsPhoto +
                                  data.coursePhoto,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Image.asset(
                                "assets/images/quizPhoto.jpeg",
                                fit: BoxFit.fill,
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                "assets/images/quizPhoto.jpeg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: isLoading
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
                  text: "Continue",
                  press: () async {
                    setState(() {
                      isLoading = true;
                    });
                    print(brandTital);
                    var deptname =
                        brandTital!.map((c) => "%27$c%27").toList().join(',');
                    final uri =
                        Uri.parse("${ApiConstant.giveQuiz}?dept=$deptname");
                    print(uri);
                    brandTital!.isEmpty 
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Center(
                                child: Text(
                                  "Please select interested feilds...",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        : Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return quizQueAns(
                                  data: uri.toString(),
                                );
                              },
                            ),
                          );
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
        )
      ],
    );
  }
}
