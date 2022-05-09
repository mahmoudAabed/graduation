class UserModel {
  late String userId, email, name, pic;
  late bool isAdmin;
  UserModel(this.userId, this.email, this.name, this.pic, this.isAdmin);
  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null)
      return;
    else {
      userId = map['userId'];
      email = map['email'];
      name = map['name'];
      pic = map['pic'];
      isAdmin = map['isAdmin'];
    }
  }
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'isAdmin': isAdmin,
    };
  }
}
