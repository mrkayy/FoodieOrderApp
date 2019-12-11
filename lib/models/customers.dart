
class CustomerProfile{
  String _cName;
  String _phone;
  String _orderCount; 
  int _id;

  CustomerProfile(this._cName, this._phone, this._orderCount, this._id);

  CustomerProfile.map(dynamic obj) {
    this._cName = obj["customerName"];
    this._phone = obj["phone"];
    this._orderCount = obj["orderCount"];
    this._id = obj["id"];
  }

  String get customerName => _cName;
  String get phone => _phone;
  String get orcerCount => _orderCount;
  int get id => _id;

  Map<String,dynamic> toMap(){
    var map = new Map<String,dynamic>();
    map["customerName"] = _cName;
    map["orderCount"] = _orderCount;
    map["phone"] = _phone;

    if(_id != null){
      map["id"] = _id;
    }

    return map;
  }

  CustomerProfile.fromMap(Map<String,dynamic>map){
    this._cName = map["customerName"];
    this._phone = map["phone"];
    this._orderCount = map["orderCount"];
  }
}
