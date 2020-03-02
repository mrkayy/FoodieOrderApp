class Customers {
  int id;
  String ln;
  String fn;
  String phoneNumber;

  Customers({this.id,this.fn, this.ln, this.phoneNumber});

  Customers.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.fn = map["firstName"];
    this.ln = map["lastName"];
    this.phoneNumber = map["phone"];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = this.id;
    map["firstName"] = this.fn;
    map["lastName"] = this.ln;
    map["phone"] = this.phoneNumber;
    return map;
  }
}
