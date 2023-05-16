class OrdersModel {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? type;
  int? quantity;

  OrdersModel(
      {this.id, this.name, this.address, this.phone, this.type, this.quantity});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    address = json["address"];
    phone = json["phone"];
    type = json["type"];
    quantity = json["quantity"];
  }

  @override
  String toString() {
    return "{'id = $id, name= $name'}";
  }
}
