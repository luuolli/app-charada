class CharadaModel {
  String pergunta;
  String resposta;

  CharadaModel({this.pergunta, this.resposta});

  CharadaModel.fromJson(Map<String, dynamic> json) {
    pergunta = json['pergunta'];
    resposta = json['resposta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pergunta'] = this.pergunta;
    data['resposta'] = this.resposta;
    return data;
  }
}
