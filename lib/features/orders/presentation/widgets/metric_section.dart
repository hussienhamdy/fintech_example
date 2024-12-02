import 'package:fintech_example/core/utils/app_colors.dart';
import 'package:fintech_example/features/orders/presentation/widgets/metric_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MetricSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final double averagePrice;
  final int totalCount;

  const MetricSection(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      required this.averagePrice,
      required this.totalCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 24.sp,
              color: AppColors.primaryText,
            ),
            SizedBox(width: 10.w),
            Text(title, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Flexible(
                child: MetricCard(
                    title: "Total Count",
                    color: color,
                    value: totalCount.toString())),
            SizedBox(width: 10.w),
            Flexible(
              child: MetricCard(
                  title: "Average Price",
                  color: color,
                  value: "\$ ${averagePrice.toStringAsFixed(2)}"),
            ),
          ],
        ),
      ],
    );
  }
}
