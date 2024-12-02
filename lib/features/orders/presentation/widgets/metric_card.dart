import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final Color color;
  final String value;

  const MetricCard({
    super.key,
    required this.title,
    required this.color,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: ScreenUtil().screenWidth / 2,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center),
          Text(value, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
