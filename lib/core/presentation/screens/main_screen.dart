import 'package:fintech_example/core/utils/dependency_injection.dart';
import 'package:fintech_example/features/orders/presentation/cubits/orders_graph_cubit.dart';
import 'package:fintech_example/features/orders/presentation/cubits/orders_metrics_cubit.dart';
import 'package:fintech_example/features/orders/presentation/screens/graph_screen.dart';
import 'package:fintech_example/features/orders/presentation/screens/metrics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return BlocProvider(
              create: (context) => getIt<OrdersMetricsCubit>(),
              child: const MetricsScreen(),
            );
          } else {
            return BlocProvider(
              create: (context) => getIt<OrdersGraphCubit>(),
              child: const GraphScreen(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Metrics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Graph',
          ),
        ],
      ),
    );
  }
}
