class Movimentacao {
  int? id;

  int? produtoId;

  int quantidade;

  String tipo;

  DateTime data;

  bool ativo;

  Movimentacao({
    this.id,

    this.produtoId,

    required this.quantidade,

    required this.tipo,

    required this.data,

    this.ativo = true,
  });

  Map<String, dynamic> toMap() {
    return{
      'id': id,

      'produtoId': produtoId,

      'quantidade': quantidade,

      'tipo': tipo,

      'data': data.toIso8601String(),

      'ativo': ativo ? 1 : 0,

    };  
  }

  factory Movimentacao.fromMap(Map<String, dynamic> map) {
    return Movimentacao(
      id: map['id'],

      produtoId: map['produtoId'],

      quantidade: map['quantidade'],

      tipo: map['tipo'],

      data: DateTime.parse(map['data']),
      
      ativo: map['ativo'] == 1,
    );
  }
}

