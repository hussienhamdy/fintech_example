import 'package:fintech_example/core/utils/app_colors.dart';
import 'package:fintech_example/features/orders/presentation/cubits/orders_metrics_cubit.dart';
import 'package:fintech_example/features/orders/presentation/cubits/orders_metrics_state.dart';
import 'package:fintech_example/features/orders/presentation/widgets/metric_card.dart';
import 'package:fintech_example/features/orders/presentation/widgets/metric_section.dart';
import 'package:fintech_example/features/orders/presentation/widgets/metric_section_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MetricsScreen extends StatefulWidget {
  const MetricsScreen({super.key});

  @override
  State<MetricsScreen> createState() => _MetricsScreenState();
}

class _MetricsScreenState extends State<MetricsScreen> {
  @override
  void initState() {
    BlocProvider.of<OrdersMetricsCubit>(context).getOrdersMetrics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Metrics')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<OrdersMetricsCubit, OrdersMetricsState>(
          builder: (context, state) {
            if (state is OrdersMetricsStateSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  MetricSection(
                      title: "Ordered Orders",
                      icon: Icons.shopping_cart,
                      color: AppColors.blue,
                      averagePrice:
                          state.ordersMetrics.orderedOrdersAveragePrice,
                      totalCount: state.ordersMetrics.orderedOrdersTotalCount),
                  SizedBox(height: 30.h),
                  MetricSection(
                      title: "Delivered Orders",
                      icon: Icons.local_shipping,
                      color: AppColors.green,
                      averagePrice:
                          state.ordersMetrics.deliveredOrdersAveragePrice,
                      totalCount:
                          state.ordersMetrics.deliveredOrdersTotalCount),
                  SizedBox(height: 30.h),
                  MetricSection(
                      title: "Returned Orders",
                      icon: Icons.undo,
                      color: AppColors.pink,
                      averagePrice:
                          state.ordersMetrics.returnedOrdersAveragePrice,
                      totalCount: state.ordersMetrics.returnedOrdersTotalCount),
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  const MetricSectionShimmer(),
                  SizedBox(height: 30.h),
                  const MetricSectionShimmer(),
                  SizedBox(height: 30.h),
                  const MetricSectionShimmer()
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
