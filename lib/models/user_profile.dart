class UserProfile {
  int id;
  String fn;
  String userName;
  String phoneNumber;

  UserProfile({
    this.id,
    this.fn,
    this.userName,
    this.phoneNumber,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
        id: map['id'],
        fn: map["firstName"],
        phoneNumber: map["phone"],
        userName: map["user"]);
  }

  Map<String, dynamic> toMap() {
    // var map = Map<String, dynamic>();
    // map["id"] = this.id;
    // map["firstName"] = this.fn;
    // map["phone"] = this.phoneNumber;
    // map["user"] = this.userName;

    var map = <String, dynamic>{
      'firstName': this.fn,
      'user': this.userName,
      'phone': this.phoneNumber,
    };

    if (id != null) {
      map["id"] = this.id;
    }
    return map;
  }
}
