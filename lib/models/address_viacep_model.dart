class AddressViaCepModel {
  late String _cep;
  late String _logradouro;
  late String _complemento;
  late String _bairro;
  late String _cidade;
  late String _uf;

  AddressViaCepModel(
    this._cep,
    this._logradouro,
    this._complemento,
    this._bairro,
    this._cidade,
    this._uf,
  );

  AddressViaCepModel.create(
    this._logradouro,
    this._complemento,
    this._bairro,
    this._cidade,
    this._uf,
  );

  String get cep => _cep;
  set cep(String cep) => _cep = cep;

  String get logradouro => _logradouro;
  set logradouro(String logradouro) => _logradouro = logradouro;

  String get complemento => _complemento;
  set complemento(String complemento) => _complemento = complemento;

  String get bairro => _bairro;
  set bairro(String bairro) => _bairro = bairro;

  String get localidade => _cidade;
  set localidade(String localidade) => _cidade = localidade;

  String get uf => _uf;
  set uf(String uf) => _uf = uf;

  AddressViaCepModel.fromJson(Map<String, dynamic> json) {
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _complemento = json['complemento'];
    _bairro = json['bairro'];
    _cidade = json['localidade'];
    _uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['complemento'] = _complemento;
    data['bairro'] = _bairro;
    data['localidade'] = _cidade;
    data['uf'] = _uf;

    return data;
  }

  Map<String, dynamic> toJsonCreate() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['logradouro'] = _logradouro;
    data['complemento'] = _complemento;
    data['bairro'] = _bairro;
    data['localidade'] = _cidade;
    data['uf'] = _uf;

    return data;
  }

  @override
  String toString() {
    return 'Address(_cep: $_cep, _logradouro: $_logradouro, _complemento: $_complemento, _bairro: $_bairro, _cidade: $_cidade, _uf: $_uf)';
  }
}
