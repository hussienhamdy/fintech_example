import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class GraphSectionShimmer extends StatelessWidget {
  const GraphSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: Shimmer.fromColors(
          baseColor: Colors.grey.shade500,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 300.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        )),
        SizedBox(height: 30.h),
        Flexible(
            child: Shimmer.fromColors(
          baseColor: Colors.grey.shade500,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 300.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        )),
        SizedBox(height: 30.h),
        Flexible(
            child: Shimmer.fromColors(
          baseColor: Colors.grey.shade500,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 300.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        )),
      ],
    );
  }
}
