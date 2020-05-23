class FoodSubCategory {
  int id;
  String name;
  String categoryID;
  double minPrice;
  bool isAvaliable;

  FoodSubCategory({
    this.id,
    this.name,
    this.categoryID,
    this.minPrice,
    this.isAvaliable = true,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "foodName": this.name,
      'minimumPrice': this.minPrice,
      'isAvaliable': this.isAvaliable ? 1 : 0,
      "foodCategoryID": this.categoryID,
    };

    if (id != null) {
      map["id"] = this.id;
    }
    return map;
  }

  FoodSubCategory.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.name = map["foodName"];
    this.minPrice = map['minimumPrice'];
    this.categoryID = map["foodCategoryID"];
    this.isAvaliable = map['foodCategoryID'] == 1 ? true : false;
  }
}
