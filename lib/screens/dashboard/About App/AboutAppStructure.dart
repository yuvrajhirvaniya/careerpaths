// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:career_paths/constants.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../size_config.dart';

class pages extends StatelessWidget {
  final String? text;
  final Function? press;
  final IconData iconData;
  const pages({
    super.key,
    required this.text,
    required this.press,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ListTile(
        minLeadingWidth: 0,
        onTap: press as void Function()?,
        leading: Icon(iconData),
        title: Text(text!),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
