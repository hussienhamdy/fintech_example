import 'package:fintech_example/core/utils/enums.dart';
import 'package:fintech_example/core/utils/failures.dart';
import 'package:fintech_example/features/orders/domain/order.dart';
import 'package:fintech_example/features/orders/domain/order_repository.dart';
import 'package:fintech_example/features/orders/domain/orders_graph_data.dart';
import 'package:fintech_example/features/orders/presentation/cubits/orders_graph_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersGraphCubit extends Cubit<OrdersGraphState> {
  final OrderRepository _orderRepository;
  OrdersGraphCubit(this._orderRepository) : super(OrdersGraphStateInitial());

  Future<void> getOrdersGraph() async {
    emit(OrdersGraphStateLoading());
    final result = await _orderRepository.getAllOrders();
    if (result.getValue() is Failure) {
      emit(OrdersGraphStateFailure(result.getValue()));
    } else {
      List<Order> orders = result.getValue();
      Map<DateTime, OrdersGraphData> map = {};
      for (int i = 0; i < orders.length; i++) {
        DateTime date =
            DateTime(orders[i].registered.year, orders[i].registered.month);
        if (!map.containsKey(date)) {
          map[date] = OrdersGraphData(
              deliveredOrders: 0, orderedOrders: 0, returnedOrders: 0);
        }
        if (orders[i].status == OrderStatus.ordered) {
          map[date] = OrdersGraphData(
              deliveredOrders: map[date]!.deliveredOrders,
              orderedOrders: map[date]!.orderedOrders + 1,
              returnedOrders: map[date]!.returnedOrders);
        } else if (orders[i].status == OrderStatus.delivered) {
          map[date] = OrdersGraphData(
              deliveredOrders: map[date]!.deliveredOrders + 1,
              orderedOrders: map[date]!.orderedOrders,
              returnedOrders: map[date]!.returnedOrders);
        } else {
          map[date] = OrdersGraphData(
              deliveredOrders: map[date]!.deliveredOrders,
              orderedOrders: map[date]!.orderedOrders,
              returnedOrders: map[date]!.returnedOrders + 1);
        }
      }
      final sortedEntries = map.entries.toList()
        ..sort((a, b) => a.key.compareTo(b.key)); // Sort by DateTime
      map = Map.fromEntries(sortedEntries);
      emit(OrdersGraphStateSuccess(map));
    }
  }
}
