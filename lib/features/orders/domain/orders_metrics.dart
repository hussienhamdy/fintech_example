class OrdersMetrics {
  final int deliveredOrdersTotalCount;
  final double deliveredOrdersAveragePrice;
  final int orderedOrdersTotalCount;
  final double orderedOrdersAveragePrice;
  final int returnedOrdersTotalCount;
  final double returnedOrdersAveragePrice;

  OrdersMetrics(
      {required this.deliveredOrdersTotalCount,
      required this.deliveredOrdersAveragePrice,
      required this.orderedOrdersTotalCount,
      required this.orderedOrdersAveragePrice,
      required this.returnedOrdersTotalCount,
      required this.returnedOrdersAveragePrice});
}
