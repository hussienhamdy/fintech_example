enum OrderStatus { delivered, returned, ordered }

class EnumHandler {
  static T? enumFromString<T>(Iterable<T> values, String? value) {
    if (value == null) {
      return null;
    }
    return values.firstWhere(
        (type) => type.toString().split(".").last == value.toLowerCase());
  }

  static String? stringFromEnum(dynamic value) {
    if (value == null) {
      return null;
    }
    return value.toString().split('.').last.toLowerCase();
  }
}

abstract class Enums<T> {
  final T _value;

  const Enums(this._value);

  T get value => _value;
}
