import 'package:career_paths/constants.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const ProfileWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                // color: Colors.black54.withOpacity(.5),
                color: kPrimaryColor,
                size: 24,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: const TextStyle(
                  // color: Colors.black54,
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            // color: Colors.black54.withOpacity(.4),
            color: kPrimaryColor,
            size: 16,
          )
        ],
      ),
    );
  }
}
