// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class privacyPolicy extends StatefulWidget {
  @override
  State<privacyPolicy> createState() => _privacyPolicyState();
}

class _privacyPolicyState extends State<privacyPolicy> {
  late WebViewController _controller;
  bool _isLoading = true;
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
                    "Privacy & Policy",
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
          child: Stack(
            children: [
              WebView(
                initialUrl:
                    "https://careerpaths.psolution.in/privacy_policy/privacyPolicy",
                onPageFinished: (url) {
                  setState(() {
                    _isLoading = false;
                  });
                },
                javascriptMode: JavascriptMode.unrestricted,
                gestureNavigationEnabled: true,
                zoomEnabled: false,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                },
                navigationDelegate: (NavigationRequest request) async {
                  if (request.url.startsWith('mailto:')) {
                    await launch(request.url);
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
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
      ),
    );
  }
}
