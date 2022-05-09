class CartActivityModel {
  String? id, name, image;
  int? cost;
  CartActivityModel(this.id, this.name, this.image, this.cost);

  CartActivityModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null)
      return;
    else {
      id = map['id'];
      name = map['name'];
      image = map['image'];
      cost = map['cost'];
    }
  } //end fromJson

  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'cost': cost,
    };
  }
}
