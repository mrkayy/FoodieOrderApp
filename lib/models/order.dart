class PlaceOrder {
  int _id;
  // int _qty;
  int _orderAmount;
  String _userName;
  String _dateCreated;
  String _phoneNum;
  List<String> _orderItem;

  PlaceOrder(
    this._orderAmount,
    this._dateCreated,
    this._orderItem,
    this._phoneNum,
    this._userName,
    // this._qty,
  );
  
  int get id => _id;
  String get userName => _userName;
  int get orderAmount => _orderAmount;
  List<String> get orderItem => _orderItem;
  String get dateCreated => _dateCreated;
  // int get qty => _qty;
  String get phoneNum => _phoneNum;

  PlaceOrder.map(dynamic obj) {
    // this._qty = obj["qty"];
    this._userName = obj["userName"];
    this._orderAmount = obj["orderAmount"];
    this._orderItem = obj["orderItem"];
    this._dateCreated = obj["dateCreated"];
    this._phoneNum = obj["phoneNum"];
    this._id = obj["id"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["userName"] = _userName;
    map["orderAmount"] = _orderAmount;
    map["orderItem"] = _orderItem;
    map["dateCreated"] = _dateCreated;
    map["phoneNum"] = _phoneNum;
    // map["qty"] = _qty;

    if (_id != null) {
      map["id"] = _id;
    }

    return map;
  }

  PlaceOrder.fromMap(Map<String, dynamic> map){
    this._orderItem = map["orderItem"];
    this._orderAmount = map["orderAmount"];
    this._phoneNum = map["phoneNumber"];
    // this._qty = map["qty"];
    this._userName = map["userName"];
    this._dateCreated = map["dateCreated"];
  }
}
