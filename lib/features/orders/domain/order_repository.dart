import 'package:fintech_example/core/utils/either.dart';
import 'package:fintech_example/features/orders/domain/order.dart';

abstract class OrderRepository {
  Future<Either<List<Order>>> getAllOrders();
}
