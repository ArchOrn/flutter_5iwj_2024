class User {
  final int id;
  final String name;
  final String address;

  User({
    required this.id,
    required this.name,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var address = json['address']['street'];
    if (json['address']['suite'] != null) address += ' ${json['address']['suite']}';
    if (json['address']['zipcode'] != null) address += ', ${json['address']['zipcode']}';
    if (json['address']['city'] != null) address += ' ${json['address']['city']}';
    return User(
      id: json['id'],
      name: json['name'],
      address: address,
    );
  }
}
