import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MetricSectionShimmer extends StatelessWidget {
  const MetricSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Shimmer.fromColors(
          baseColor: Colors.grey.shade500,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 120.h,
            width: ScreenUtil().screenWidth / 2,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        )),
        SizedBox(width: 10.w),
        Flexible(
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 120.h,
              width: ScreenUtil().screenWidth / 2,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        )
      ],
    );
  }
}
