// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:career_paths/components/custom_surfix_icon.dart';
import 'package:career_paths/components/default_button.dart';
import 'package:career_paths/components/form_error.dart';
import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_up/otp/otp_screen.dart';

class CompleteProfileForm extends StatefulWidget {
  final String email;
  final String password;
  final String gender;
  const CompleteProfileForm(
      {super.key,
      required this.email,
      required this.password,
      required this.gender});
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  //api call
  final Sign_up = Signupapi();
  final TextEditingController f_name = TextEditingController();
  final TextEditingController l_name = TextEditingController();
  final TextEditingController phone_no = TextEditingController();
  final TextEditingController stn_address = TextEditingController();
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
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

  String qualification = "SSC";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          qualificationformField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
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
                  text: "continue",
                  press: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      final value = await Sign_up.signup(
                          widget.email,
                          widget.password,
                          qualification,
                          f_name.text,
                          l_name.text,
                          phone_no.text,
                          stn_address.text,
                          widget.gender);
                      if (value != '' && value == 'user found') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Center(
                              child: Text(
                                "Account is already exist",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        );
                      } else if (value != '' && value != 'user found') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Center(
                              child: Text("Verification Code Sent in Email",
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OtpScreen_signup(id: value),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Center(
                              child: Text("Somthing went wrong",
                                  style: TextStyle(fontSize: 16)),
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

  Stack qualificationformField() {
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
                        qualification = 'SSC';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: qualification == 'SSC'
                            ? kPrimaryColor
                            : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(28),
                          bottomLeft: Radius.circular(28),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "SSC",
                          style: TextStyle(
                              color: qualification == "SSC"
                                  ? Colors.white
                                  : kTextColor,
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
                        qualification = 'HSC';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: qualification == 'HSC'
                            ? kPrimaryColor
                            : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(28),
                          bottomRight: Radius.circular(28),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "HSC",
                          style: TextStyle(
                              color: qualification == "HSC"
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
                    "Qualification",
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

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: stn_address,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: phone_no,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: l_name,
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: f_name,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
