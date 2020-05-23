class OrderItems {
  String id;
  String orderID;
  String customerID;
  String orderItemName;
  String foodCategotyID;
  double orderItemAmount;

  OrderItems({
    this.id,
    this.orderID,
    this.customerID,
    this.orderItemName,
    this.foodCategotyID,
    this.orderItemAmount,
  });

  factory OrderItems.fromMap(Map<String, dynamic> map) {
    return OrderItems(
        id: map['id'],
        orderID: map['orderId'],
        customerID: map['customerId'],
        orderItemName: map['orderItemName'],
        orderItemAmount: map['orderItemAmount'],
        foodCategotyID: map['foodCategoryID']);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'orderId': orderID,
      'customerId': customerID,
      'orderItemName': orderItemName,
      'orderItemAmount': orderItemAmount,
      'foodCategoryID': foodCategotyID
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }
}
