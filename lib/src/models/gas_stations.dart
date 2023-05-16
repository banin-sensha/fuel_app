class GasStationsModel {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? status;

  GasStationsModel({this.id, this.name, this.address, this.phone, this.status});

  GasStationsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    address = json["address"];
    phone = json["phone"];
    status = json["status"];
  }

  @override
  String toString() {
    return "{'id = $id, name= $name'}";
  }
}
