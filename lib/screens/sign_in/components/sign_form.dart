// ignore_for_file: use_build_context_synchronously

import 'package:career_paths/components/custom_surfix_icon.dart';
import 'package:career_paths/components/form_error.dart';
import 'package:career_paths/helper/keyboard.dart';
import 'package:career_paths/screens/forgot_password/forgot_password_screen.dart';
import 'package:career_paths/screens/login_success/login_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final loginApi = LoginApi();
  final TextEditingController loginPsw = TextEditingController();
  final TextEditingController loginEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool loginisObscure = true;
  bool? remember = false;
  bool isLoading = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                    loginisObscure = !loginisObscure;
                  });
                },
              ),
              Text("Show Password"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
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
                      // if all are valid then go to success screenset
                      setState(() {
                        isLoading = true;
                      });
                      KeyboardUtil.hideKeyboard(context);
                      var value = await loginApi.login(
                          loginEmail.text, loginPsw.text);
                      if (value) {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool("login", true);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return LoginSuccessScreen();
                            },
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                "Invalid Credential",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        );
                      }
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: loginPsw,
      obscureText: loginisObscure,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
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
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: loginEmail,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
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
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
