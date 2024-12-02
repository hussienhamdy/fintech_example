import 'package:fintech_example/core/utils/enums.dart';
import 'package:fintech_example/features/orders/presentation/cubits/orders_graph_cubit.dart';
import 'package:fintech_example/features/orders/presentation/cubits/orders_graph_state.dart';
import 'package:fintech_example/features/orders/presentation/widgets/graph_section.dart';
import 'package:fintech_example/features/orders/presentation/widgets/graph_section_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  void initState() {
    BlocProvider.of<OrdersGraphCubit>(context).getOrdersGraph();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders Graphs')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<OrdersGraphCubit, OrdersGraphState>(
          builder: (context, state) {
            if (state is OrdersGraphStateSuccess) {
              return SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    "Below are the graphs for every orders type in the year 2021",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: 30.h),
                  GraphSection(
                      status: OrderStatus.ordered, graphData: state.graphData),
                  SizedBox(height: 30.h),
                  GraphSection(
                      status: OrderStatus.delivered,
                      graphData: state.graphData),
                  SizedBox(height: 30.h),
                  GraphSection(
                      status: OrderStatus.returned, graphData: state.graphData),
                ],
              ));
            } else {
              return const GraphSectionShimmer();
            }
          },
        ),
      ),
    );
  }
}
