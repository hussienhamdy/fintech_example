import 'dart:convert';
import 'package:fintech_example/features/orders/data/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class DataSource {
  Future<List<OrderModel>> getAllOrders();
}

class DataSourceImpl implements DataSource {
  @override
  Future<List<OrderModel>> getAllOrders() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final jsonString = await rootBundle.loadString('assets/orders.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => OrderModel.fromJson(json)).toList();
    } catch (error, stackTrace) {
      debugPrint("error $error, stackTrace $stackTrace");
      rethrow;
    }
  }
}
