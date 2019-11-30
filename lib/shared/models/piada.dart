class PiadaModel {
  String piada;

  PiadaModel({this.piada});

  PiadaModel.fromJson(Map<String, dynamic> json) {
    piada = json['piada'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['piada'] = this.piada;
    return data;
  }
}
