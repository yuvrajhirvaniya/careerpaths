import 'package:flutter/material.dart';

import '../../../../../api/instituteController.dart';
import '../../../../../constants.dart';
import '../../../../../model/courses_fee_model.dart';
import '../../../../../size_config.dart';

class cutoff_details extends StatefulWidget {
  const cutoff_details({super.key, required this.data});
  final List<Course> data;
  @override
  State<cutoff_details> createState() => _cutoff_detailsState();
}

class _cutoff_detailsState extends State<cutoff_details> {
  final authApi = InstituteApi();

  @override
  Widget build(BuildContext context) {
    return widget.data.isEmpty
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
            child: ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierColor: Colors.black.withOpacity(0.67),
                      barrierDismissible: true,
                      context: context,
                      builder: (context) =>
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overScroll) {
                          overScroll.disallowIndicator();
                          return true;
                        },
                        child: AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          content: StatefulBuilder(
                            builder: (context, setState) =>
                                SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FutureBuilder(
                                      future: authApi.getMeritList(
                                          widget.data[index].courseId),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const CircularProgressIndicator();
                                        } else if (snapshot.hasData) {
                                          return snapshot.data!.isEmpty
                                              ? const Text("No data Found")
                                              : ListView.builder(
                                                  itemCount:
                                                      snapshot.data!.length,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder: (context, i) =>
                                                      ExpansionTile(
                                                    collapsedTextColor:
                                                        kTextColor,
                                                    collapsedIconColor:
                                                        kTextColor,
                                                    iconColor: kTextColor,
                                                    textColor: kTextColor,
                                                    title: Text(
                                                      snapshot.data![i].Year,
                                                    ),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 15),
                                                        child: Table(
                                                          border:
                                                              TableBorder.all(
                                                            color: kTextColor
                                                                .withOpacity(
                                                                    0.6),
                                                            width: 2,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(10),
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                          children: [
                                                            TableRow(
                                                              decoration:
                                                                  const BoxDecoration(
                                                                      color:
                                                                          kPrimaryColor,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(10),
                                                                        topRight:
                                                                            Radius.circular(10),
                                                                      )),
                                                              children: [
                                                                Column(
                                                                  children: const [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        'Cast',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  children: const [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        'Merit',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            TableRow(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          3),
                                                                  child: Column(
                                                                    children: const [
                                                                      Text(
                                                                        'General:',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          3),
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                        "${snapshot.data![i].cutOff[0].generalCutOff}%",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            TableRow(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          3),
                                                                  child: Column(
                                                                    children: const [
                                                                      Text(
                                                                        'Obc:',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          3),
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                        "${snapshot.data![i].cutOff[0].obcCutOff}%",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            TableRow(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          3),
                                                                  child: Column(
                                                                    children: const [
                                                                      Text(
                                                                        'Scst:',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          3),
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                        "${snapshot.data![i].cutOff[0].scstCutOff}%",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            TableRow(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          3),
                                                                  child: Column(
                                                                    children: const [
                                                                      Text(
                                                                        'Esm:',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          3),
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                        "${snapshot.data![i].cutOff[0].esmCutOff}%",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                        }
                                        return SizedBox.shrink();
                                      })
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Container(
                          width: SizeConfig.screenWidth,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: kTextColor.withOpacity(0.6)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.data[index].courseName,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: kTextColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Eligibility: " +
                                      widget.data[index].eligiblity,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
