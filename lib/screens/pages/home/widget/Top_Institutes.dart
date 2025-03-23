// ignore_for_file: camel_case_types, non_constant_identifier_names, file_names

import 'package:career_paths/model/institute_model.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class top_insti extends StatelessWidget {
  const top_insti({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.data,
  }) : super(key: key);

  final double width, aspectRetio;
  final InstituteModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5.0),
      padding: const EdgeInsets.all(10.0),
      height: 140.0,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 199, 190, 190)),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://careerpaths.psolution.in/gallery/' +
                    data.institutePhoto,
                fit: BoxFit.fill,
                width: 150,
                height: 110,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    data.instituteName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
                Text(
                  data.location,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                  maxLines: 1,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          data.ratings,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 20,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Color(0xFF4A3298),
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Icon(
                              Icons.remove_red_eye_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}




// // ignore_for_file: camel_case_types, non_constant_identifier_names

// import 'package:career_paths/screens/pages/Institutes/model/institutes_list.dart';
// import 'package:flutter/material.dart';

// import '../../../../constants.dart';
// import '../../../../size_config.dart';

// class top_insti extends StatelessWidget {
//   const top_insti({
//     Key? key,
//     this.width = 140,
//     this.aspectRetio = 1.02,
//     required this.top_institutes,
//   }) : super(key: key);

//   final double width, aspectRetio;
//   final Institute top_institutes;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
//       child: SizedBox(
//         width: getProportionateScreenWidth(140),
//         child: GestureDetector(
//           onTap: () {},
//           child: Column(
//             children: [
//               AspectRatio(
//                 aspectRatio: 1.02,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: kSecondaryColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.asset(
//                       top_institutes.image,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 height: 42,
//                 child: Text(
//                   top_institutes.name,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(color: Colors.black),
//                   maxLines: 2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
