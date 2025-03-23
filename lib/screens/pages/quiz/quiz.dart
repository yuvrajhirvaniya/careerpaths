import 'package:career_paths/screens/pages/quiz/showIntrestedFieldList/showIntrestedFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api.dart';
import '../../../api/model/intrestedFieldListModel.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final Api = quizApi();
  List<IntrestedFieldList> Filedlist = [];
  loadData() async {
    Filedlist = await Api.getIntrestedFieldList();
    setState(() {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScoll) {
        overScoll.disallowIndicator();
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
                    "Quiz",
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
          child: Filedlist.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    FieldList(
                      Fileds: Filedlist,
                    ),
                  ],
                )),
        ),
      ),
    );
  }
}
