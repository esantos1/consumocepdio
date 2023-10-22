class AddressBack4AppListModel {
  late List<AddressesBack4AppModel> _results;

  AddressBack4AppListModel(this._results);

  List<AddressesBack4AppModel> get results => _results;
  set results(List<AddressesBack4AppModel> results) => _results = results;

  AddressBack4AppListModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _results = <AddressesBack4AppModel>[];
      json['results'].forEach((v) {
        _results.add(AddressesBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = _results.map((v) => v.toJson()).toList();
    return data;
  }
}

class AddressesBack4AppModel {
  late String _objectId;
  late String _cep;
  late String _logradouro;
  late String _complemento;
  late String _bairro;
  late String _cidade;
  late String _estado;
  late String _createdAt;
  late String _updatedAt;

  AddressesBack4AppModel(
    this._objectId,
    this._cep,
    this._logradouro,
    this._complemento,
    this._bairro,
    this._cidade,
    this._estado,
    this._createdAt,
    this._updatedAt,
  );

  AddressesBack4AppModel.create(
    this._cep,
    this._logradouro,
    this._complemento,
    this._bairro,
    this._cidade,
    this._estado,
  );

  String get objectId => _objectId;
  set objectId(String objectId) => _objectId = objectId;
  String get cep => _cep;
  set cep(String cep) => _cep = cep;
  String get logradouro => _logradouro;
  set logradouro(String logradouro) => _logradouro = logradouro;
  String get complemento => _complemento;
  set complemento(String complemento) => _complemento = complemento;
  String get bairro => _bairro;
  set bairro(String bairro) => _bairro = bairro;
  String get cidade => _cidade;
  set cidade(String cidade) => _cidade = cidade;
  String get estado => _estado;
  set estado(String estado) => _estado = estado;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  AddressesBack4AppModel.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _complemento = json['complemento'];
    _bairro = json['bairro'];
    _cidade = json['cidade'];
    _estado = json['estado'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['objectId'] = _objectId;
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['complemento'] = _complemento;
    data['bairro'] = _bairro;
    data['cidade'] = _cidade;
    data['estado'] = _estado;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;

    return data;
  }

  Map<String, dynamic> toJsonCreate() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['complemento'] = _complemento;
    data['bairro'] = _bairro;
    data['cidade'] = _cidade;
    data['estado'] = _estado;

    return data;
  }
}
