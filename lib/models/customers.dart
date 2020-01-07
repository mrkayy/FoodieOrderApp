
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


class CreateCustomer{
  int _id;
  String _fName;
  String _lName;
  String _cPhone;
  String _date;

  CreateCustomer(this._fName,this._cPhone,this._date,[this._lName]);
  CreateCustomer.withID(this._id,this._fName,this._cPhone,this._date,[this._lName]);

  int get id => _id;
  String get fName => _fName;
  String get lName => _lName;
  String get cPhone => _cPhone;
  String get date => _date;

  //create setter for fields
  set fName(String firstName){
    if(firstName.length <= 255){
      this._fName = firstName;
    }
  }
  set lName(String lastName){
    if(lastName.length <= 255){
      this._lName = lastName;
    }
  }
  set cPhone(String phone){
    if(phone.length <= 255){
      this._cPhone = phone;
    }
  }
  set date(String newDate)=>this._cPhone = newDate;

  //Creating the data toMap
  
  Map<String,dynamic> toMap(){

    var map = new Map<String,dynamic>();
    if(_id != null){
      map["id"] = _id;
    }

    map["fName"] = _fName;
    map["lName"] = _lName;
    map["cPhone"] = _cPhone;
    map["date"] = _date;

    return map;
  }

  
  CreateCustomer.fromMap(Map<String,dynamic>map){
    this._id = map["id"];
    this._fName = map["fName"];
    this._lName = map["lName"];
    this._cPhone = map["cPhone"];
    this._date = map["date"];
  }

}