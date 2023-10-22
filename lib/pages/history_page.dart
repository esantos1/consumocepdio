import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de CEPs consultados')),
      body: ListView.separated(
          itemBuilder: (_, index) {
            return _buildItem();
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: 2),
    );
  }

  Widget _buildItem() => ListTile(
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
        ),
      );
}
