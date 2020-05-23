class FoodOrder {
  String id;
  int orderID;
  int orderItemID;
  String orderDate;
  String orderStatus;
  double orderAmount;

  FoodOrder({
    this.id,
    this.orderID,
    this.orderDate,
    this.orderStatus,
    this.orderItemID,
    this.orderAmount,
  });

  factory FoodOrder.fromMap(Map<String, dynamic> map) {
    return FoodOrder(
        id: map['id'],
        orderID: map['orderId'],
        orderDate: map['date'],
        orderItemID: map['orderItemId'],
        orderAmount: map['orderTotalAmount']);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'orderId': orderID,
      'date': orderDate,
      'orderItemId': orderItemID,
      'orderTotalAmount': orderAmount
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }
}
