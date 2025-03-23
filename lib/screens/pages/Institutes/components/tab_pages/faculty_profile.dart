import 'package:career_paths/api/Const%20Api/api_constant.dart';
import 'package:career_paths/constants.dart';
import 'package:flutter/material.dart';
import '../../../../../model/faculty_model.dart';
import '../../../../../size_config.dart';

class faculty_details extends StatefulWidget {
  const faculty_details({super.key, required this.data});
  final List<FacultyModel> data;
  @override
  State<faculty_details> createState() => _faculty_detailsState();
}

class _faculty_detailsState extends State<faculty_details> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overSCroll) {
        overSCroll.disallowIndicator();
        return true;
      },
      child: widget.data.isEmpty
          ? Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "No data available",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  )
                ],
              ),
            )
          : Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ListView.builder(
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierColor: Colors.black.withOpacity(0.67),
                          barrierDismissible: true,
                          context: context,
                          builder: (context) => AlertDialog(
                            contentPadding: const EdgeInsets.only(
                                top: 20, bottom: 5, left: 10, right: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            content: Builder(
                              builder: (context) {
                                var height = SizeConfig.screenHeight;
                                return SizedBox(
                                  height: height - 400,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: kTextColor,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(55),
                                          child: FadeInImage(
                                            placeholder: const AssetImage(
                                                'assets/images/no_user.jpg'),
                                            image: NetworkImage(
                                              ApiConstant.facultyPhotoUrl +
                                                  widget
                                                      .data[index].facultyPhoto,
                                            ),
                                            imageErrorBuilder:
                                                (BuildContext context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                              return Image.asset(
                                                'assets/images/no_user.jpg',
                                                fit: BoxFit.fill,
                                                width: 110,
                                                height: 110,
                                              );
                                            },
                                            fit: BoxFit.fill,
                                            width: 110,
                                            height: 110,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        widget.data[index].facultyName,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: kTextColor),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          widget.data[index].facultyPost,
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontSize: 16, color: kTextColor),
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: const [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10),
                                                    child: Icon(
                                                      size: 25,
                                                      Icons
                                                          .account_balance_outlined,
                                                      color: kTextColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Department:",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: kTextColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 35),
                                                child: Text(
                                                  widget.data[index].department,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: kTextColor),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: const [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10),
                                                    child: Icon(
                                                      size: 25,
                                                      Icons.school_outlined,
                                                      color: kTextColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Qualification:",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: kTextColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 35),
                                                child: Text(
                                                  widget.data[index]
                                                      .facultyQualification,
                                                  textAlign: TextAlign.justify,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: kTextColor),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: const [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10),
                                                    child: Icon(
                                                      size: 25,
                                                      Icons.assessment_outlined,
                                                      color: kTextColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Experience:",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: kTextColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 35),
                                                child: Text(
                                                  widget.data[index].experience,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: kTextColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 199, 190, 190)),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 1),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 1, color: kTextColor),
                                    borderRadius: BorderRadius.circular(31)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: FadeInImage(
                                    placeholder: const AssetImage(
                                        'assets/images/no_user.jpg'),
                                    image: NetworkImage(
                                      ApiConstant.facultyPhotoUrl +
                                          widget.data[index].facultyPhoto,
                                    ),
                                    imageErrorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image.asset(
                                        'assets/images/no_user.jpg',
                                        fit: BoxFit.fill,
                                        width: 60,
                                        height: 60,
                                      );
                                    },
                                    fit: BoxFit.fill,
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.data[index].facultyName,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: kTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.data[index].department,
                                    maxLines: 2,
                                    style: const TextStyle(color: kTextColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
