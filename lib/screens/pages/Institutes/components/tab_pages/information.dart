import 'package:career_paths/constants.dart';
import 'package:career_paths/screens/pages/Institutes/model/institutes_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../model/institute_model.dart';

class info extends StatefulWidget {
  const info({super.key, required this.product});
  final InstituteModel product;
  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return widget.product == null
        ? Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "No data available",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kPrimaryColor, fontSize: 16),
                )
              ],
            ),
          )
        : Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            size: 25,
                            // Icons.account_balance_outlined,
                            Icons.assignment,
                            color: kTextColor,
                          ),
                        ),
                        Text(
                          "About Institute:",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.product.history +
                          " " +
                          widget.product.achievement +
                          "" +
                          widget.product.mission,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            size: 25,
                            Icons.location_on,
                            color: kTextColor,
                          ),
                        ),
                        Text(
                          "Address:",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.product.location,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            size: 25,
                            // Icons.account_balance_outlined,
                            Icons.phone_in_talk,
                            color: kTextColor,
                          ),
                        ),
                        Text(
                          "Contact Number:",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () async {
                        await launchUrl(
                          Uri(scheme: 'tel', path: widget.product.contact),
                        );
                      },
                      child: Text(
                        widget.product.contact,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            size: 25,
                            // Icons.account_balance_outlined,
                            Icons.location_city_sharp,
                            color: kTextColor,
                          ),
                        ),
                        Text(
                          "State:",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.product.city,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            size: 25,
                            // Icons.account_balance_outlined,
                            Icons.email,
                            color: kTextColor,
                          ),
                        ),
                        Text(
                          "Email:",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () async {
                        await launchUrl(
                          Uri(
                            scheme: 'mailto',
                            path: widget.product.instituteEmail,
                            queryParameters: {
                              'To': widget.product.instituteEmail,
                            },
                          ),
                        );
                      },
                      child: Text(
                        widget.product.instituteEmail,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
