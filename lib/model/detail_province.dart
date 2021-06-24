class DetailByProvince {
  int socakhoi;
  int socadangdieutri;
  int socatuvong;
  String hcKey;
  int value;

  DetailByProvince(
      {required this.socakhoi,
      required this.socadangdieutri,
      required this.socatuvong,
      required this.hcKey,
      required this.value});

  factory DetailByProvince.fromJson(Map<String, dynamic> json) {
    return DetailByProvince(
      socakhoi: json['socakhoi'],
      socadangdieutri: json['socadangdieutri'],
      socatuvong: json['socatuvong'],
      hcKey: json['hc-key'],
      value: json['value'],
    );
  }
}