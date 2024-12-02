// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderModel {
  final String id;
  final bool isActive;
  final String price;
  final String company;
  final String picture;
  final String buyer;
  final List<String> tags;
  final String status;
  final String registered;

  OrderModel({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });

  // Factory method to create an Order object from JSON
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      isActive: json['isActive'],
      price: json['price'],
      company: json['company'],
      picture: json['picture'],
      buyer: json['buyer'],
      tags: List<String>.from(json['tags']),
      status: json['status'],
      registered: json['registered'],
    );
  }

  // Method to convert an Order object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isActive': isActive,
      'price': price,
      'company': company,
      'picture': picture,
      'buyer': buyer,
      'tags': tags,
      'status': status,
      'registered': registered,
    };
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, isActive: $isActive, price: $price, company: $company, picture: $picture, buyer: $buyer, tags: $tags, status: $status, registered: $registered)';
  }
}
