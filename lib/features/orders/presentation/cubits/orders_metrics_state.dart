import 'package:fintech_example/core/utils/failures.dart';
import 'package:fintech_example/features/orders/domain/orders_metrics.dart';

class OrdersMetricsState {}

final class OrdersMetricsStateInitial extends OrdersMetricsState {}

final class OrdersMetricsStateLoading extends OrdersMetricsState {}

final class OrdersMetricsStateFailure extends OrdersMetricsState {
  final Failure failure;
  OrdersMetricsStateFailure(this.failure);
}

final class OrdersMetricsStateSuccess extends OrdersMetricsState {
  final OrdersMetrics ordersMetrics;
  OrdersMetricsStateSuccess(this.ordersMetrics);
}
