// ignore_for_file: file_names

import 'package:career_paths/constants.dart';
import 'package:career_paths/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../api/Const Api/api_constant.dart';
import '../../../../model/institute_model.dart';

class InstititueDesign extends StatefulWidget {
  const InstititueDesign({super.key, required this.data});

  final InstituteModel data;

  @override
  State<InstititueDesign> createState() => _InstititueDesignState();
}

class _InstititueDesignState extends State<InstititueDesign> {
  bool isCheckFav = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Toggle Favorite button

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 1),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          child: FadeInImage(
                            placeholder: const AssetImage(
                                'assets/images/no_institute.png'),
                            image: NetworkImage(ApiConstant.frontPhoto +
                                widget.data.institutePhoto),
                            imageErrorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/images/no_institute.png',
                                fit: BoxFit.cover,
                                height: 260,
                                width: double.infinity,
                              );
                            },
                            fit: BoxFit.fill,
                            height: 260,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                                color: kPrimaryColor,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                      color: Colors.white,
                                      size: 30,
                                      Icons.account_balance_outlined),
                                ))),
                        title: Text(
                          widget.data.instituteName, //institute name
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Icon(
                                      color: kPrimaryColor,
                                      size: 25,
                                      Icons.location_on),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.data.location,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 4),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Icon(
                                      color: kPrimaryColor,
                                      size: 25,
                                      Icons.location_city_sharp),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.data.city,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await launchUrl(
                                Uri(scheme: 'tel', path: widget.data.contact),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: const Icon(
                                        color: kPrimaryColor,
                                        size: 25,
                                        Icons.phone_in_talk),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.data.contact,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await launchUrl(
                                Uri(
                                  scheme: 'mailto',
                                  path: widget.data.instituteEmail,
                                  queryParameters: {
                                    'to': widget.data.instituteEmail,
                                  },
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: const Icon(
                                        color: kPrimaryColor,
                                        size: 25,
                                        Icons.email),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.data.instituteEmail,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "View More",
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Consumer<Favprovider>(
                              builder: (context, value, child) {
                            isCheckFav = value.favList.any(
                              (element) =>
                                  element.instituteId ==
                                  widget.data.instituteId,
                            );

                            return IconButton(
                              alignment: Alignment.center,
                              onPressed: () async {
                                setState(() {
                                  isCheckFav = value.favList.any(
                                    (element) =>
                                        element.instituteId ==
                                        widget.data.instituteId,
                                  );
                                  isCheckFav
                                      ? value.removeModel(widget.data)
                                      : value.addMode(widget.data);
                                });
                              },
                              icon: Icon(
                                // value.favList.contains(widget.data)
                                isCheckFav
                                    ? Icons.favorite_sharp
                                    : Icons.favorite_border_sharp,
                                size: 30,
                                color: kPrimaryColor,
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
