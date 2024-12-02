import 'package:fintech_example/core/utils/failures.dart';
import 'package:fintech_example/features/orders/domain/orders_graph_data.dart';

class OrdersGraphState {}

final class OrdersGraphStateInitial extends OrdersGraphState {}

final class OrdersGraphStateLoading extends OrdersGraphState {}

final class OrdersGraphStateFailure extends OrdersGraphState {
  final Failure failure;
  OrdersGraphStateFailure(this.failure);
}

final class OrdersGraphStateSuccess extends OrdersGraphState {
  final Map<DateTime, OrdersGraphData> graphData;
  OrdersGraphStateSuccess(this.graphData);
}
