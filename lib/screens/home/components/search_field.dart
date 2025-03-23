import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  double screenwidth = 0;
  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth - 5,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(10)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search...",
            prefixIcon: Icon(
              Icons.search,
              color: blackColor,
            )),
      ),
    );
  }
}
