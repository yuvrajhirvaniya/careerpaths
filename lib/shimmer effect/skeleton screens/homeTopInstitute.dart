import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../skeleton.dart';

class skeletonTopInstitute extends StatelessWidget {
  const skeletonTopInstitute({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            const Skeleton(height: 120, width: 120),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Skeleton(width: 80),
                  const SizedBox(height: 16.0 / 2),
                  const Skeleton(),
                  const SizedBox(height: 16.0 / 2),
                  const Skeleton(),
                  const SizedBox(height: 16.0 / 2),
                  Row(
                    children: const [
                      Expanded(
                        child: Skeleton(),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Skeleton(),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
