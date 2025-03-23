import 'package:career_paths/components/custom_surfix_icon.dart';
import 'package:career_paths/components/default_button.dart';
import 'package:career_paths/components/form_error.dart';
import 'package:career_paths/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController SignupEmail = TextEditingController();
  final TextEditingController SignupPsw = TextEditingController();
  final TextEditingController SignupconfirmPsw = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool signupisObscure = true;
  bool? remember = false;
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

  String gender = "Male";

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
          buildConformPassFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          genderFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                    signupisObscure = !signupisObscure;
                  });
                },
              ),
              Text("Show Password"),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return CompleteProfileScreen(
                        email: SignupEmail.text,
                        password: SignupPsw.text,
                        gender: gender,
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Stack genderFormField() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 64,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: kTextColor),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Row(
            children: [
              Flexible(
                  flex: 1,
                  child: InkWell(
                    splashColor: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28),
                        bottomLeft: Radius.circular(28)),
                    onTap: () {
                      setState(() {
                        gender = 'Male';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: gender == 'Male' ? kPrimaryColor : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          bottomLeft: Radius.circular(28),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Male",
                          style: TextStyle(
                              color:
                                  gender == "Male" ? Colors.white : kTextColor,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  )),
              const VerticalDivider(
                width: 4,
                color: kTextColor,
              ),
              Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        gender = 'Female';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            gender == 'Female' ? kPrimaryColor : Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(28),
                          bottomRight: Radius.circular(28),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Female",
                          style: TextStyle(
                              color: gender == "Female"
                                  ? Colors.white
                                  : kTextColor,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 36.0,
          right: 0.0,
          child: Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Text(
                    "Gender",
                    style: TextStyle(
                        color: kTextColor,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      controller: SignupconfirmPsw,
      obscureText: signupisObscure,
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
      decoration: InputDecoration(
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
      controller: SignupPsw,
      obscureText: signupisObscure,
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
      controller: SignupEmail,
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
