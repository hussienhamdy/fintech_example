// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrdersGraphData {
  final int orderedOrders;
  final int deliveredOrders;
  final int returnedOrders;

  OrdersGraphData(
      {required this.orderedOrders,
      required this.deliveredOrders,
      required this.returnedOrders});

  @override
  String toString() =>
      'OrdersGraphData(orderedOrders: $orderedOrders, deliveredOrders: $deliveredOrders, returnedOrders: $returnedOrders)';
}
