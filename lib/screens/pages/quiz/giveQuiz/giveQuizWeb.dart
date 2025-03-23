// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class quizQueAns extends StatefulWidget {
  final String data;
  const quizQueAns({super.key, required this.data});

  @override
  State<quizQueAns> createState() => _quizQueAnsState();
}

class _quizQueAnsState extends State<quizQueAns> {
  @override
  void initState() {
    print(widget.data);
    super.initState();
  }

  late WebViewController _controller;
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.only(top: getProportionateScreenWidth(30)),
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0xffDDDDDD),
              blurRadius: 1.0,
              offset: Offset(0.0, 0.0),
            )
          ],
          // color: Colors.white,
          color: _isLoading == true ? Colors.white : kPrimaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Stack(
          children: [
            WebView(
              initialUrl: widget.data,
              onPageFinished: (url) {
                setState(() {
                  _isLoading = false;
                });
              },
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
              zoomEnabled: false,
              onWebViewCreated: (WebViewController controller) {
                _controller = controller;
              },
            ),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
