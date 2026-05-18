class Fornecedor {
  int? id;

  int telefone;

  String nomeEmpresa;

  String email;

  String contato;

  bool ativo;

  Fornecedor({
    this.id,

    required this.nomeEmpresa,

    required this.telefone,

    required this.email,

    required this.contato,

    this.ativo = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,

      'nomeEmpresa': nomeEmpresa,

      'contato': contato,

      'email': email,

      'telefone': telefone,

      'ativo': ativo ? 1 : 0,
    };
  }

  factory Fornecedor.fromMap(Map<String,dynamic> map) {
    return Fornecedor(
      id: map['id'],

      nomeEmpresa: map['nomeEmpresa'],
      telefone: map['telefone'],
      email: map['email'],
      contato: map['contato'],
      ativo: map['ativo'] == 1,
    );
  }
}
