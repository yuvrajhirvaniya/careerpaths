import 'package:career_paths/components/custom_surfix_icon.dart';
import 'package:career_paths/components/default_button.dart';
import 'package:career_paths/components/form_error.dart';
import 'package:career_paths/components/no_account_text.dart';
import 'package:career_paths/screens/otp/otp_screen.dart';
import 'package:career_paths/size_config.dart';
import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
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
                Column(
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(28),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Please enter your email and we will send you \n 6 digit code for the verification process",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                ForgotPassForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final SendEmail = forgotPassword();
  final TextEditingController _forgotemail = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _forgotemail,
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              // if (value.isNotEmpty && errors.contains(kEmailNullError)) {
              if (value.isNotEmpty) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
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
                      final value =
                          await SendEmail.emailSend(_forgotemail.text);
                      if (value != '') {
                        print("verification code send");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(id: value),
                          ),
                        );
                      } else {
                        print('User Not Found');
                      }
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          const NoAccountText(),
        ],
      ),
    );
  }
}
