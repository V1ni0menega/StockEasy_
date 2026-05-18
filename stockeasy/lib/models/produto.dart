// estanos criando o molde de um  Produto, com atributos que representam um produto no sistema de estoque. Ela possui os seguintes atributos:

class Produto {
  int? id;

  String nome;

  String categoria;

  double preco;

  int quantidade;

  DateTime dataCadastro;

  bool ativo;

  Produto({
    this.id,

    required this.nome,

    required this.categoria,

    required this.preco,

    required this.quantidade,

    required this.dataCadastro,

    this.ativo = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,

      'nome': nome,

      'categoria': categoria,

      'preco': preco,

      'quantidade': quantidade,

      'dataCadastro': dataCadastro.toIso8601String(),

      'ativo': ativo ? 1 : 0,
    };
  }
  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'],

      nome: map['nome'],

      categoria: map['categoria'],

      preco: map['preco'],

      quantidade: map['quantidade'],

      dataCadastro: DateTime.parse(map['dataCadastro']),

      ativo: map['ativo'] == 1,
    );
  }
}
