class MainWeatherModel {
  int id = 0;
  String name = '';
  String desc = '';
  String iconCode = '';

  MainWeatherModel({
    this.id = 0,
    this.name = '',
    this.desc = '',
    this.iconCode = '',
  });

  MainWeatherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['main'];
    desc = json['description'];
    iconCode = json['icon'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': name,
      'description': desc,
      'icon': iconCode,
    };
  }
}
