import 'package:career_paths/animation/fade_animation.dart';
import 'package:career_paths/components/default_button.dart';
import 'package:career_paths/screens/forgot_password/set%20password/body.dart';
import 'package:career_paths/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../api/api.dart';
import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  final String id;
  const OtpForm({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final SendOtp = forgotPassword();
  var Full_otp;
  final TextEditingController val1 = TextEditingController();
  final TextEditingController val2 = TextEditingController();
  final TextEditingController val3 = TextEditingController();
  final TextEditingController val4 = TextEditingController();
  final TextEditingController val5 = TextEditingController();
  final TextEditingController val6 = TextEditingController();
  bool isLoading = false;

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: FadeAnimation(
        delay: 1.5,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(50),
                  child: TextFormField(
                    controller: val1,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    autofocus: true,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      // nextField(value, pin2FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(50),
                  child: TextFormField(
                    controller: val2,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    // onChanged: (value) => nextField(value, pin3FocusNode),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(50),
                  child: TextFormField(
                    controller: val3,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    // onChanged: (value) => nextField(value, pin4FocusNode),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(50),
                  child: TextFormField(
                    controller: val4,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    // onChanged: (value) => nextField(value, pin5FocusNode),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(50),
                  child: TextFormField(
                    controller: val5,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    focusNode: pin5FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    // onChanged: (value) => nextField(value, pin6FocusNode),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(50),
                  child: TextFormField(
                    controller: val6,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    focusNode: pin6FocusNode,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin6FocusNode!.unfocus();
                        // Then you need to check is the code is correct or not
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.15),
            isLoading
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
                      if (val1.text.isNotEmpty &&
                          val2.text.isNotEmpty &&
                          val3.text.isNotEmpty &&
                          val4.text.isNotEmpty &&
                          val5.text.isNotEmpty &&
                          val6.text.isNotEmpty) {
                        setState(
                          () {
                            Full_otp = val1.text +
                                val2.text +
                                val3.text +
                                val4.text +
                                val5.text +
                                val6.text;
                            print(Full_otp);
                          },
                        );
                        setState(() {
                          isLoading = true;
                        });
                        final value = await SendOtp.forgotPasswordVerification(
                                widget.id, Full_otp)
                            .then((value) {
                          print(value);
                          if (value) {
                            print("Set Password");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Set_password(
                                  id: widget.id,
                                ),
                              ),
                            );
                          } else {
                            print("invalid verification code");
                          }
                        });
                        setState(() {
                          isLoading = false;
                        });
                      } else {
                        print("Please enter value");
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
