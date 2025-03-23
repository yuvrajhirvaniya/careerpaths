// ignore_for_file: file_names

import 'package:career_paths/constants.dart';
import 'package:flutter/material.dart';

class QueAns extends StatefulWidget {
  String question;
  String answer;
  QueAns({super.key, required this.question, required this.answer});

  @override
  State<QueAns> createState() => _QueAnsState();
}

class _QueAnsState extends State<QueAns> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: kTextColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Ans: ${widget.answer}",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
