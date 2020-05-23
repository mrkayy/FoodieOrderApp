class UserAuthentication {
  int id;
  String user;
  String password;
  bool loginState;

  UserAuthentication({
    this.id,
    this.user,
    this.password,
    this.loginState,
  });

  // UserAuthentication.user(
  //     int id, String user, String password, bool loginState) {
  //   this.id = id;
  //   this.user = user;
  //   this.password = password;
  //   this.loginState = loginState;
  // }

  UserAuthentication.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.user = map["user"];
    this.password = map["password"];
    this.loginState = map["loginState"] == 1 ? true : false;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user': this.user,
      'password': this.password,
      'loginState': this.loginState ? 1 : 0,
    };

    if (id != null) {
      map["id"] = this.id;
    }
    return map;
  }
}
