import 'package:fintech_example/core/utils/either.dart';
import 'package:fintech_example/core/utils/enums.dart';
import 'package:fintech_example/core/utils/failures.dart';
import 'package:fintech_example/core/utils/utils.dart';
import 'package:fintech_example/features/orders/data/data_source.dart';
import 'package:fintech_example/features/orders/domain/order.dart';
import 'package:fintech_example/features/orders/domain/order_repository.dart';
import 'package:flutter/material.dart';

class OrderRepositoryImpl extends OrderRepository {
  final DataSource dataSource;

  OrderRepositoryImpl({required this.dataSource});

  @override
  Future<Either<List<Order>>> getAllOrders() async {
    try {
      final result = await dataSource.getAllOrders();
      List<Order> orders = [];
      for (var i = 0; i < result.length; i++) {
        orders.add(Order(
            id: result[i].id,
            isActive: result[i].isActive,
            price: Utils.parsePrice(result[i].price),
            company: result[i].company,
            picture: result[i].picture,
            buyer: result[i].buyer,
            tags: result[i].tags,
            status: EnumHandler.enumFromString(
                    OrderStatus.values, result[i].status) ??
                OrderStatus.ordered,
            registered: DateTime.parse(result[i].registered)));
      }
      return Either(value: orders);
    } catch (error, stackTrace) {
      debugPrint("error getAllOrders $error, stackTrace: $stackTrace");
      return Either(failure: GeneralFailure());
    }
  }
}
