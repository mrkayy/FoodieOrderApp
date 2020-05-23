class FoodCategory {
  int id;
  bool status;
  String name;
  String className;

  FoodCategory({
    this.id,
    this.status = true,
    this.name,
    this.className,
  });

  FoodCategory.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.name = map["categoryName"];
    this.className = map['className'];
    this.status = map['status'] == 1 ? true : false;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "categoryName": name,
      'className': className,
      'status': status ? 1 : 0
    };
    if (id != null) {
      map["id"] = this.id;
    }

    return map;
  }
}
