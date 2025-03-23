import 'package:career_paths/shimmer%20effect/skeleton.dart';
import 'package:flutter/material.dart';

//this skeleton for the suggestion video screen
class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          const Skeleton(height: 120, width: 150),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Skeleton(),
                SizedBox(height: 16.0 / 2),
                Skeleton(),
                SizedBox(height: 16.0 / 2),
                Skeleton(),
                SizedBox(height: 16.0 / 2),
                Skeleton(
                  width: 70,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
