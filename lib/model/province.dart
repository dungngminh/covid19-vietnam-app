class Province {
  String name;
  String hcKey;

  Province({required this.name, required this.hcKey});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      name: json['name'],
      hcKey: json['hec-key'],
    );
  }
}
