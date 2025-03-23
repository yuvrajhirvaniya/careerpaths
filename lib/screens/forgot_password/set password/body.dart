import 'package:career_paths/animation/fade_animation.dart';
import 'package:career_paths/components/custom_surfix_icon.dart';
import 'package:career_paths/components/default_button.dart';
import 'package:career_paths/components/form_error.dart';
import 'package:career_paths/screens/forgot_password/set%20password/Reset_success/resetpswd_success_screen.dart';
import 'package:career_paths/size_config.dart';
import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../../constants.dart';

class Set_password extends StatefulWidget {
  final String id;
  Set_password({
    required this.id,
  });
  @override
  State<Set_password> createState() => _Set_passwordState();
}

class _Set_passwordState extends State<Set_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  FadeAnimation(
                    delay: 1,
                    child: Column(
                      children: [
                        Text(
                          "Reset Password",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(28),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Please enter your new password",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  newPassForm(id: widget.id),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class newPassForm extends StatefulWidget {
  final String id;
  newPassForm({required this.id});
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<newPassForm> {
  final sendNewpassword = forgotPassword();
  final TextEditingController setupPsw = TextEditingController();
  final TextEditingController setupconfirmPsw = TextEditingController();
  bool isLoading = false;
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  bool? remember = false;
  String? password;
  String? conform_password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: FadeAnimation(
        delay: 1.5,
        child: Column(
          children: [
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildConformPassFormField(),
            SizedBox(height: getProportionateScreenHeight(10)),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                      isObscure = !isObscure;
                    });
                  },
                ),
                const Text("Show Password"),
              ],
            ),
            FormError(errors: errors),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
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
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() {
                          isLoading = true;
                        });
                        final value = await sendNewpassword
                            .setnewPassword(widget.id, setupconfirmPsw.text)
                            .then((value) {
                          if (value) {
                            print("New Password is set");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => forgot_SuccessScreen(),
                              ),
                            );
                          } else {
                            print("Somthing went wrong");
                          }
                        });
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
            SizedBox(height: SizeConfig.screenHeight * 0.1 - 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Remember your password? ",
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).popUntil((route) => route.isFirst),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      controller: setupconfirmPsw,
      obscureText: isObscure,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: setupPsw,
      obscureText: isObscure,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}
