class FoodList {
  String _itemName;
  double _unitCost;

  FoodList(this._unitCost, this._itemName);

  String get name => _itemName;
  double get unitCost => _unitCost;

  set name(String text) {
    if (text != null) {
      this._itemName = text;
    }
  }
  set unitCost(double cost) {
    if (cost != null) {
      this._unitCost = cost;
    }
  }

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();

    map['name'] = _itemName;
    map['unitCost'] = _unitCost;

    return map;
  }

  FoodList.fromMap(Map<String,dynamic>map){
    this._itemName = map['name'];
    this._unitCost = map['unitCost'];
  }
}