import 'package:consumoviacep/models/address_back4app_model.dart';
import 'package:dio/dio.dart';

class AddressBack4AppRepository {
  late Dio _dio;

  AddressBack4AppRepository() {
    _dio = Dio();

    _dio.options.headers = {
      'X-Parse-Application-Id': 'FUGHcTA3v8Io8VCnWExy0QYeuXwrmJ5979y2M0Xy',
      'X-Parse-REST-API-Key': '02iGGHNiiu3vaq0xryodc27beTp4qHi9uMpb2fow',
      'Content-Type': 'application/json'
    };

    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }

  Future<AddressBack4AppListModel> getAddresses() async {
    final response = await _dio.get('/Enderecos');
    final addresses = AddressBack4AppListModel.fromJson(response.data);

    print(response);

    return addresses;
  }

  Future<void> create(AddressesBack4AppModel address) async {
    try {
      await _dio.post(
        '/Enderecos',
        data: address.toJsonCreate(),
      );
    } catch (e) {
      throw e;
    }
  }
}
