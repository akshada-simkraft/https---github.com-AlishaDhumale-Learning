import 'package:flutter/material.dart';
import 'package:learning/provider/clients_provider.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<ClientProvider>(context, listen: false).getClientsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Screen1'),
          ),
        ),
        body: PlutoGrid(
          columns: columns,
          rows: rows,
        ));
  }

// pluto
  final columns = [
    PlutoColumn(title: 'Column1', field: '1', type: PlutoColumnType.text()),
    PlutoColumn(title: 'Column2', field: '2', type: PlutoColumnType.text()),
    PlutoColumn(title: 'Column3', field: '3', type: PlutoColumnType.text()),
    PlutoColumn(title: 'Column4', field: '4', type: PlutoColumnType.text()),
    PlutoColumn(title: 'Column5', field: '5', type: PlutoColumnType.text()),
  ];

  final rows = [
    PlutoRow(cells: {
      '1': PlutoCell(value: 'abcd'),
      '2': PlutoCell(value: 'abcd'),
      '3': PlutoCell(value: 'abcd'),
      '4': PlutoCell(value: 'abcd'),
      '5': PlutoCell(value: 'abcd'),
    })
  ];
}
