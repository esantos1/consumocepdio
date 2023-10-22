import 'package:consumoviacep/models/address_viacep_model.dart';
import 'package:dio/dio.dart';

class AddressViaCepRequestRepository {
  AddressViaCepRequestRepository();

  Future<AddressViaCepModel> getData(String cep) async {
    final url = 'https://viacep.com.br/ws/$cep/json/';
    final response = await Dio().get(url);

    if (response.statusCode == 200) {
      final body = response.data;

      if (body.containsKey('erro') && body['erro']) {
        throw Exception('CEP não encontrado');
      } else {
        AddressViaCepModel address = AddressViaCepModel.fromJson(body);

        return address;
      }
    } else if (response.statusCode == 400) {
      throw Exception('CEP Inválido!');
    } else {
      throw Exception(
          'Desculpe, ocorreu um erro interno. Por Favor, tente novamente.');
    }
  }
}
