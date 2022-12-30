class OrderModel {
  int count;
  int totalPrice;
  String orderId;
  String productId;
  String userId;
  String orderStatus;
  String createdAt;
  String productName;

  OrderModel({
    required this.count,
    required this.totalPrice,
    required this.orderId,
    required this.productId,
    required this.userId,
    required this.orderStatus,
    required this.createdAt,
    required this.productName,
  });

  OrderModel copWith({
    int? count,
    int? totalPrice,
    String? orderId,
    String? productId,
    String? userId,
    String? orderStatus,
    String? createdAt,
    String? productName,
  }) =>
      OrderModel(
        count: count ?? this.count,
        totalPrice: totalPrice ?? this.totalPrice,
        orderId: orderId ?? this.orderId,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        userId: userId ?? this.userId,
        orderStatus: orderStatus ?? this.orderStatus,
        createdAt: createdAt ?? this.createdAt,
      );

  factory OrderModel.fromJson(Map<String, dynamic> jsonData) {
    return OrderModel(
      count: jsonData['count'] as int? ?? 0,
      totalPrice: jsonData['totalPrice'] as int? ?? 0,
      orderId: jsonData['orderId'] as String? ?? '',
      productName: jsonData['productName'] as String? ?? '',
      productId: jsonData['productId'] as String? ?? '',
      userId: jsonData['userId'] as String? ?? '',
      orderStatus: jsonData['orderStatus'] as String? ?? '',
      createdAt: jsonData['createdAt'] as String? ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'totalPrice': totalPrice,
      'orderId': orderId,
      'productId': productId,
      'userId': userId,
      'orderStatus': orderStatus,
      'createdAt': createdAt,
      'productName': productName,
    };
  }

  @override
  String toString() {
    return '''
      count: $count,
      totalPrice: $totalPrice,
      orderId: $orderId,
      productId: $productId,
      userId: $userId,
      orderStatus: $orderStatus,
      createdAt: $createdAt,
      productName: $productName,
      ''';
  }
}
