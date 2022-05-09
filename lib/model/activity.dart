class Activity {
  String? name, image, id;
  String? description;
  int? cost;
  Activity({this.name, this.image, this.description, this.cost, this.id});

  Activity.fromJson(Map<dynamic, dynamic> map) {
    if (map == null)
      return;
    else {
      id = map['id'];
      name = map['name'];
      image = map['image'];
      description = map['description'];
      cost = map['cost'];
    }
  } //end fromJson

  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'cost': cost,
    };
  }
}
