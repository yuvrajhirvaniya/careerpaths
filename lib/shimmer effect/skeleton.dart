import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.2),
        highlightColor: Colors.white,
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(16.0 / 2),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: const BorderRadius.all(Radius.circular(16.0))),
        ),
      ),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.white,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
