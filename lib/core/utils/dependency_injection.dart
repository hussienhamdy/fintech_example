import 'package:fintech_example/features/orders/data/data_source.dart';
import 'package:fintech_example/features/orders/data/order_repository_impl.dart';
import 'package:fintech_example/features/orders/domain/order_repository.dart';
import 'package:fintech_example/features/orders/presentation/cubits/orders_graph_cubit.dart';
import 'package:fintech_example/features/orders/presentation/cubits/orders_metrics_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<DataSource>(() => DataSourceImpl());

  getIt.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(dataSource: getIt<DataSource>()));

  getIt.registerFactory(() => OrdersMetricsCubit(getIt<OrderRepository>()));

  getIt.registerFactory(() => OrdersGraphCubit(getIt<OrderRepository>()));
}
