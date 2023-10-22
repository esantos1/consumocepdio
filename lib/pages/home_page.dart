import 'package:consumoviacep/models/address_viacep_model.dart';
import 'package:consumoviacep/pages/history_page.dart';
import 'package:consumoviacep/repositories/address_viacep_request_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cepController = TextEditingController(text: '');
  bool isShowning = false;
  bool isLoaded = true;
  final repository = AddressViaCepRequestRepository();
  late AddressViaCepModel addressViaCep;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar CEP'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HistoryPage()),
            ),
            icon: Icon(Icons.history),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: cepController,
            decoration: InputDecoration(
              label: Text('CEP'),
              hintText: 'Ex.: 01001000',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: showData,
              icon: Icon(Icons.search),
              label: Text('Pesquisar'),
            ),
          ),
          isShowning ? _showItems(context) : SizedBox(),
        ],
      ),
    );
  }

  Widget _showItems(BuildContext context) {
    if (isLoaded) {
      return Column(
        children: [
          SizedBox(height: 16),
          _dataAddressItem(context, 'CEP', addressViaCep.cep),
          SizedBox(height: 16),
          _dataAddressItem(context, 'Logradouro', addressViaCep.logradouro),
          SizedBox(height: 16),
          _dataAddressItem(context, 'Complemento', addressViaCep.complemento),
          SizedBox(height: 16),
          _dataAddressItem(context, 'Bairro', addressViaCep.bairro),
          SizedBox(height: 16),
          _dataAddressItem(context, 'Cidade', addressViaCep.localidade),
          SizedBox(height: 16),
          _dataAddressItem(context, 'Estado/UF', addressViaCep.uf),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: clearData,
              icon: Icon(Icons.refresh),
              label: Text('Pesquisar novo CEP'),
            ),
          ),
        ],
      );
    } else {
      return Expanded(child: Center(child: CircularProgressIndicator()));
    }
  }

  Widget _dataAddressItem(BuildContext context, String label, String value) =>
      Card(
        child: ListTile(
          title: Text(
            label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(value, style: TextStyle(fontSize: 14.0)),
        ),
      );

  void showData() async {
    setState(() {
      isLoaded = false;
      isShowning = true;
    });

    addressViaCep = await repository.getData(cepController.text);

    setState(() {
      isLoaded = true;
    });
  }

  void clearData() {
    setState(() => isShowning = false);

    cepController.text = '';
  }
}
