import 'package:fintech_example/core/utils/enums.dart';
import 'package:fintech_example/core/utils/failures.dart';
import 'package:fintech_example/features/orders/domain/order.dart';
import 'package:fintech_example/features/orders/domain/order_repository.dart';
import 'package:fintech_example/features/orders/domain/orders_metrics.dart';
import 'package:fintech_example/features/orders/presentation/cubits/orders_metrics_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersMetricsCubit extends Cubit<OrdersMetricsState> {
  final OrderRepository _orderRepository;
  OrdersMetricsCubit(this._orderRepository)
      : super(OrdersMetricsStateInitial());

  Future<void> getOrdersMetrics() async {
    emit(OrdersMetricsStateLoading());
    final result = await _orderRepository.getAllOrders();
    if (result.getValue() is Failure) {
      emit(OrdersMetricsStateFailure(result.getValue()));
    } else {
      List<Order> orders = result.getValue();
      int deliveredOrdersTotalCount = 0;
      double deliveredOrdersAveragePrice = 0.0;
      int orderedOrdersTotalCount = 0;
      double orderedOrdersAveragePrice = 0.0;
      int returnedOrdersTotalCount = 0;
      double returnedOrdersAveragePrice = 0.0;
      for (int i = 0; i < orders.length; i++) {
        if (orders[i].status == OrderStatus.delivered) {
          deliveredOrdersTotalCount++;
          deliveredOrdersAveragePrice += orders[i].price;
        } else if (orders[i].status == OrderStatus.ordered) {
          orderedOrdersTotalCount++;
          orderedOrdersAveragePrice += orders[i].price;
        } else {
          returnedOrdersTotalCount++;
          returnedOrdersAveragePrice += orders[i].price;
        }
      }
      emit(OrdersMetricsStateSuccess(OrdersMetrics(
          deliveredOrdersTotalCount: deliveredOrdersTotalCount,
          deliveredOrdersAveragePrice:
              deliveredOrdersAveragePrice / deliveredOrdersTotalCount,
          orderedOrdersTotalCount: orderedOrdersTotalCount,
          orderedOrdersAveragePrice:
              orderedOrdersAveragePrice / orderedOrdersTotalCount,
          returnedOrdersTotalCount: returnedOrdersTotalCount,
          returnedOrdersAveragePrice:
              returnedOrdersAveragePrice / returnedOrdersTotalCount)));
    }
  }
}
