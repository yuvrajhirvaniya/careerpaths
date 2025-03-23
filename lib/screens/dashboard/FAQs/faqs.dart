import 'package:career_paths/screens/dashboard/FAQs/queAnsStructure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:career_paths/screens/dashboard/FAQs/q&a.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class FAQS extends StatefulWidget {
  const FAQS({super.key});

  @override
  State<FAQS> createState() => _FAQSState();
}

class _FAQSState extends State<FAQS> {
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
                    "FAQs",
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
              SizedBox(height: getProportionateScreenHeight(10)),
              QueAns(
                question: q1,
                answer: a1,
              ),
              QueAns(
                question: q2,
                answer: a2,
              ),
              QueAns(
                question: q3,
                answer: a3,
              ),
              QueAns(
                question: q4,
                answer: a4,
              ),
              QueAns(
                question: q5,
                answer: a5,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
