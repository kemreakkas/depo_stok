// ignore_for_file: file_names

import 'package:depostok/Constants.dart';
import 'package:flutter/material.dart';

class WarehouseList extends StatelessWidget {
  const WarehouseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Depo Listesi'),backgroundColor: canvasColor,foregroundColor: white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'ID',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Stok\nNumarası',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Ürün\nAdı',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Depo',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Stok',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Alış\nFiyatı',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Satış\nFiyatı',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Sak12345')),
                  DataCell(Text('saksı')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('100')),
                  DataCell(Text('123')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('TPRK12345')),
                  DataCell(Text('toprak')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('111')),
                  DataCell(Text('222')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('Elma123')),
                  DataCell(Text('Elma')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('5432')),
                  DataCell(Text('2345')),
                  DataCell(Text('5432')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('4')),
                  DataCell(Text('armut312312')),
                  DataCell(Text('armut')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('324')),
                  DataCell(Text('3245')),
                  DataCell(Text('97867')),
                ],
              ),DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Sak12345')),
                  DataCell(Text('saksı')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('100')),
                  DataCell(Text('123')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('TPRK12345')),
                  DataCell(Text('toprak')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('111')),
                  DataCell(Text('222')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('Elma123')),
                  DataCell(Text('Elma')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('5432')),
                  DataCell(Text('2345')),
                  DataCell(Text('5432')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('4')),
                  DataCell(Text('armut312312')),
                  DataCell(Text('armut')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('324')),
                  DataCell(Text('3245')),
                  DataCell(Text('97867')),
                ],
              ),DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Sak12345')),
                  DataCell(Text('saksı')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('100')),
                  DataCell(Text('123')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('TPRK12345')),
                  DataCell(Text('toprak')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('111')),
                  DataCell(Text('222')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('Elma123')),
                  DataCell(Text('Elma')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('5432')),
                  DataCell(Text('2345')),
                  DataCell(Text('5432')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('4')),
                  DataCell(Text('armut312312')),
                  DataCell(Text('armut')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('324')),
                  DataCell(Text('3245')),
                  DataCell(Text('97867')),
                ],
              ),DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Sak12345')),
                  DataCell(Text('saksı')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('100')),
                  DataCell(Text('123')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('TPRK12345')),
                  DataCell(Text('toprak')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('111')),
                  DataCell(Text('222')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('Elma123')),
                  DataCell(Text('Elma')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('5432')),
                  DataCell(Text('2345')),
                  DataCell(Text('5432')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('4')),
                  DataCell(Text('armut312312')),
                  DataCell(Text('armut')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('324')),
                  DataCell(Text('3245')),
                  DataCell(Text('97867')),
                ],
              ),DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Sak12345')),
                  DataCell(Text('saksı')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('100')),
                  DataCell(Text('123')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('TPRK12345')),
                  DataCell(Text('toprak')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('111')),
                  DataCell(Text('222')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('Elma123')),
                  DataCell(Text('Elma')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('5432')),
                  DataCell(Text('2345')),
                  DataCell(Text('5432')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('4')),
                  DataCell(Text('armut312312')),
                  DataCell(Text('armut')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('324')),
                  DataCell(Text('3245')),
                  DataCell(Text('97867')),
                ],
              ),DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Sak12345')),
                  DataCell(Text('saksı')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('100')),
                  DataCell(Text('123')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('TPRK12345')),
                  DataCell(Text('toprak')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('111')),
                  DataCell(Text('222')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('Elma123')),
                  DataCell(Text('Elma')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('5432')),
                  DataCell(Text('2345')),
                  DataCell(Text('5432')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('4')),
                  DataCell(Text('armut312312')),
                  DataCell(Text('armut')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('324')),
                  DataCell(Text('3245')),
                  DataCell(Text('97867')),
                ],
              ),DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Sak12345')),
                  DataCell(Text('saksı')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('100')),
                  DataCell(Text('123')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('TPRK12345')),
                  DataCell(Text('toprak')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('111')),
                  DataCell(Text('222')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('Elma123')),
                  DataCell(Text('Elma')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('5432')),
                  DataCell(Text('2345')),
                  DataCell(Text('5432')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('4')),
                  DataCell(Text('armut312312')),
                  DataCell(Text('armut')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('324')),
                  DataCell(Text('3245')),
                  DataCell(Text('97867')),
                ],
              ),DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Sak12345')),
                  DataCell(Text('saksı')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('100')),
                  DataCell(Text('123')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('TPRK12345')),
                  DataCell(Text('toprak')),
                  DataCell(Text('A Deposu')),
                  DataCell(Text('987')),
                  DataCell(Text('111')),
                  DataCell(Text('222')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('Elma123')),
                  DataCell(Text('Elma')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('5432')),
                  DataCell(Text('2345')),
                  DataCell(Text('5432')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('4')),
                  DataCell(Text('armut312312')),
                  DataCell(Text('armut')),
                  DataCell(Text('B Deposu')),
                  DataCell(Text('324')),
                  DataCell(Text('3245')),
                  DataCell(Text('97867')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
