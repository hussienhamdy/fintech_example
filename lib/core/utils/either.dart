import 'package:fintech_example/core/utils/failures.dart';

class Either<T> {
  T? value;
  Failure? failure;
  Either({this.failure, this.value});
  getValue() {
    if (failure != null) {
      return failure;
    } else {
      return value;
    }
  }
}
