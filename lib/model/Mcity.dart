
class City {

  String? name;
  String? id;
  String? address;
  String? email;
  String? phoneNumber;
  String? city;

  City({
    this.name,
    this.id,
    this.address,
    this.email,
    this.phoneNumber,
    this.city,
  });
  City.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    id = json['id']?.toString();
    address = json['address']?.toString();
    email = json['email']?.toString();
    phoneNumber = json['phoneNumber']?.toString();
    city = json['city']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['address'] = address;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['city'] = city;
    return data;
  }
}
