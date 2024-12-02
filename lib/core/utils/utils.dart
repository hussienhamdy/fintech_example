class Utils {
  static double parsePrice(String price) {
    price = price.replaceAll("\$", '').replaceAll(',', '');
    return double.tryParse(price) ?? 0.0;
  }
}
