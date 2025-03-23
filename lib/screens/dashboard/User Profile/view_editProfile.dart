// ignore_for_file: camel_case_types, avoid_returning_null_for_void, non_constant_identifier_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:career_paths/constants.dart';
import 'package:career_paths/screens/pages/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api/Const Api/api_constant.dart';
import '../../../api/api.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../size_config.dart';
import '../dash_page.dart';
import 'image_picker/screens/select_photo_options_screen.dart';
import 'dart:io';

class viewProfile extends StatefulWidget {
  const viewProfile({super.key});

  @override
  State<viewProfile> createState() => _viewProfileState();
}

class _viewProfileState extends State<viewProfile> {
  //controller for the textformfiled
  final TextEditingController SignupEmail = TextEditingController();
  final TextEditingController fname = TextEditingController();
  final TextEditingController phone_no = TextEditingController();
  final TextEditingController stn_address = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //this is for the validatation error show
  final List<String?> errors = [];
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

  var lastEducation = ""; // this for the send value to update profile
  var userId = "";
  var usrname = ""; // this for the send value to update profile
  var gender = ""; // this for the send value to update profile
  var bdate = ""; // this for the send value to update profile
  var photo = ""; // this for the send value to update profile
  var email = ""; // this for the send value to update profile
  var contact = ""; // this for the send value to update profile
  var qualification = ""; // this for the assign the value
  var address = ""; // this for the send value to update profile

  //for the get name
  void getPreference() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("studentId") ?? '';
    usrname = prefs.getString("studentName") ?? '';
    address = prefs.getString("address") ?? '';
    gender = prefs.getString("gender") ?? '';
    bdate = prefs.getString("bdate") ?? '';
    photo = prefs.getString("profilePhoto") ?? '';
    email = prefs.getString("email") ?? '';
    contact = prefs.getString("contact") ?? '';
    qualification = prefs.getString("lastEducation") ?? '';
    setState(() {
      SignupEmail.text = email;
      fname.text = usrname;
      phone_no.text = contact;
      stn_address.text = address;
      qualification == "10" ? lastEducation = "SSC" : lastEducation = "HSC";
    });
  }

  //for the take picture
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SelectPhotoOptionsScreen(
              onTap: _pickImage,
            );
          }),
    );
  }

  @override
  initState() {
    getPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginApi = LoginApi();
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
                    "Your Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate() && bdate != "") {
                          _formKey.currentState!.save();
                          var value = await loginApi
                              .updateProfile(userId, usrname, contact, address,
                                  bdate, gender, lastEducation, _image)
                              .then(
                                (value) => value
                                    ? {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: const Center(
                                                child: Text(
                                                    'Profile Updated Successfully')),
                                            backgroundColor: kPrimaryColor,
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),

                                        // Navigator.pushAndRemoveUntil(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             const DashPage()),
                                        //     (Route<dynamic> route) => false),
                                      }
                                    : {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            backgroundColor: kPrimaryColor,
                                            content: Center(
                                              child: Text(
                                                "Something Went Wrong",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        )
                                      },
                              );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: kPrimaryColor,
                              content: Center(
                                child: Text(
                                  "Please fill up the details",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: const Icon(
                        Icons.done,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: getProportionateScreenWidth(15)),
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(20)),
                  SetPhotoScreen(),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  buildEmailFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildNameFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildPhoneNumberFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  buildAddressFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  bdateFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  genderFormField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  qualificationformField(),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: FormError(errors: errors),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding qualificationformField() {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: Stack(
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
                          lastEducation = 'SSC';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: lastEducation == 'SSC'
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
                                color: lastEducation == "SSC"
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
                          lastEducation = 'HSC';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: lastEducation == 'HSC'
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
                                color: lastEducation == "HSC"
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
      ),
    );
  }

  Padding genderFormField() {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: Stack(
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
                          color:
                              gender == 'Male' ? kPrimaryColor : Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(28),
                            bottomLeft: Radius.circular(28),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Male",
                            style: TextStyle(
                                color: gender == "Male"
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
                          gender = 'Female';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              gender == 'Female' ? kPrimaryColor : Colors.white,
                          borderRadius: const BorderRadius.only(
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
      ),
    );
  }

  Padding bdateFormField() {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: GestureDetector(
        onTap: () async {
          DateTime? pickDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1980),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  dialogTheme: const DialogTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
                  colorScheme: const ColorScheme.light(
                    primary: kPrimaryColor,
                    onPrimary: Colors.white,
                    onSurface: Colors.black,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: kPrimaryColor,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                child: child!,
              );
            },
          );
          if (pickDate != null) {
            setState(() {
              bdate = DateFormat('dd-MM-yyyy').format(pickDate);
            });
          }
        },
        child: Stack(
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
                  bdate == ""
                      ? const Padding(
                          padding: EdgeInsets.only(left: 42, right: 10),
                          child: Text(
                            "Enter your birth date",
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 42, right: 10),
                          child: Text(
                            bdate,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                        ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      getProportionateScreenWidth(20),
                      getProportionateScreenWidth(20),
                      getProportionateScreenWidth(20),
                    ),
                    child: const Icon(
                      Icons.date_range,
                      color: Color.fromARGB(255, 146, 145, 145),
                    ),
                  ),
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
                        "Birth Date",
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
        ),
      ),
    );
  }

  Padding buildAddressFormField() {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: TextFormField(
        controller: stn_address,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kAddressNullError);
          }
          setState(() {
            address = stn_address.text;
          });
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
      ),
    );
  }

  Padding buildPhoneNumberFormField() {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: TextFormField(
        controller: phone_no,
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPhoneNumberNullError);
          }
          setState(() {
            contact = phone_no.text;
          });
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
      ),
    );
  }

  Padding buildNameFormField() {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: TextFormField(
        controller: fname,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kNamelNullError);
          }
          setState(() {
            usrname = fname.text;
          });
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
          labelText: "Name",
          hintText: "Enter your name",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
        ),
      ),
    );
  }

  Padding buildEmailFormField() {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: TextFormField(
        controller: SignupEmail,
        enabled: false,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: kInvalidEmailError);
          }
          setState(() {
            email = SignupEmail.text;
          });
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
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
        ),
      ),
    );
  }

  Center SetPhotoScreen() {
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _showSelectPhotoOptions(context);
        },
        child: Stack(
          children: [
            Container(
              height: 155.0,
              width: 155.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 231, 233, 240),
              ),
              child: Center(
                child: _image == null
                    ? photo != ''
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(300),
                            child: CachedNetworkImage(
                              imageUrl: ApiConstant.profileUrl + photo,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Image.asset(
                                "assets/images/no_user.jpg",
                                fit: BoxFit.fill,
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                "assets/images/no_user.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        : const Text(
                            'No image',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          )
                    : CircleAvatar(
                        backgroundImage: FileImage(_image!),
                        radius: 200.0,
                      ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white),
                    ),
                    foregroundColor: const Color(0xFFF5F6F9),
                    backgroundColor: const Color(0xFFF5F6F9),
                  ),
                  onPressed: () {
                    _showSelectPhotoOptions(context);
                  },
                  child: const Center(
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Color(0xFFFF7643),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
