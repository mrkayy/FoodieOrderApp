class FoodSubCategory {
  int id;
  String name;
  String categoryID;

  FoodSubCategory({this.id,this.name,this.categoryID});

  Map<String,dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["id"] = this.id;
    map["foodName"] = this.name;
    map["foodCategoryID"] = this.categoryID;
  }

  FoodSubCategory.fromMap(Map<String,dynamic> map){
    this.id = map["id"];
    this.name = map["foodName"];
    this.categoryID = map["foodCategoryID"];
  }

}


