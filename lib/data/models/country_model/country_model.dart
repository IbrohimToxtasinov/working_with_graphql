class CountryModel {
  final String name;
  final String code;
  final String native;
  final String phone;
  final Map<String, dynamic> continent;

  CountryModel({
    required this.name,
    required this.code,
    required this.native,
    required this.phone,
    required this.continent,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'],
      code: json['code'],
      native: json['native'],
      phone: json['phone'],
      continent: json['continent'],
    );
  }
}
