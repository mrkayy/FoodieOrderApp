class FoodCategory {
  int id;
  String name;

  FoodCategory({this.id, this.name});

  FoodCategory.fromMap(Map<String, dynamic> map) {
    this.name = map["categoryName"];
    this.id = map["id"];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String,dynamic>();
    map["id"] = this.id;
    map["categoryName"] = this.name;
    return map;
  }
}
