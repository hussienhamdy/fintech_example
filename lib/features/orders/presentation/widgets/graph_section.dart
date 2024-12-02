import 'package:fintech_example/core/utils/app_colors.dart';
import 'package:fintech_example/core/utils/enums.dart';
import 'package:fintech_example/features/orders/domain/orders_graph_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class GraphSection extends StatelessWidget {
  final OrderStatus status;
  final Map<DateTime, OrdersGraphData> graphData;

  const GraphSection(
      {super.key, required this.status, required this.graphData});

  List<LineChartBarData> _buildOrderedLineData(
      Map<DateTime, OrdersGraphData> graphData) {
    final List<FlSpot> spots = graphData.entries.map((entry) {
      return FlSpot(
        entry.key.month.toDouble(),
        entry.value.orderedOrders.toDouble(),
      );
    }).toList();

    return [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        color: AppColors.blue,
        barWidth: 3,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(show: true),
      ),
    ];
  }

  List<LineChartBarData> _buildDeliveredLineData(
      Map<DateTime, OrdersGraphData> graphData) {
    final List<FlSpot> spots = graphData.entries
        .map((entry) => FlSpot(
              entry.key.month.toDouble(),
              entry.value.deliveredOrders.toDouble(),
            ))
        .toList();

    return [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        color: AppColors.green,
        barWidth: 3,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(show: true),
      ),
    ];
  }

  List<LineChartBarData> _buildReturnedLineData(
      Map<DateTime, OrdersGraphData> graphData) {
    final List<FlSpot> spots = graphData.entries
        .map((entry) => FlSpot(
              entry.key.month.toDouble(),
              entry.value.returnedOrders.toDouble(),
            ))
        .toList();

    return [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        color: AppColors.pink,
        barWidth: 3,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(show: true),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 300.h,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 20.w,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: status == OrderStatus.ordered
                        ? AppColors.blue
                        : status == OrderStatus.delivered
                            ? AppColors.green
                            : AppColors.pink,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  status == OrderStatus.ordered
                      ? "Ordered Orders"
                      : status == OrderStatus.delivered
                          ? "Delivered Orders"
                          : "Returned Orders",
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: LineChart(
                LineChartData(
                  lineBarsData: status == OrderStatus.ordered
                      ? _buildOrderedLineData(graphData)
                      : status == OrderStatus.delivered
                          ? _buildDeliveredLineData(graphData)
                          : _buildReturnedLineData(graphData),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final date = DateTime(2021, value.toInt());
                          return Text(
                            DateFormat.MMM().format(date),
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          );
                        },
                        showTitles: true,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Colors.grey, width: 1),
                      left: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
