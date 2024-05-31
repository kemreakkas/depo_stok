// ignore_for_file: file_names

import 'package:depostok/CompanyCreate.dart';
import 'package:depostok/Constants.dart';
import 'package:flutter/material.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({super.key});

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firma Listesi'),backgroundColor: canvasColor,foregroundColor: white,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CompanyCreate2()));
              },
              child: const Text('Firma Ekle')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              DataTable(columnSpacing: height*0.05,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'ID',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'FİRMA ADI',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'KONUMU',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'İLETİŞİM KİŞİSİ',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),   DataColumn(
                    label: Text(
                      'A',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'B',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'C',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),DataColumn(
                    label: Text(
                      'D',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),DataColumn(
                    label: Text(
                      'E',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),DataColumn(
                    label: Text(
                      'F',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ), 
                ],
                rows: const <DataRow>[
                 DataRow(
                    cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('aaa')),
                      DataCell(Text('s')),
                      DataCell(Text('d')),DataCell(Text('e')),
                    ],
                  ), DataRow(
                    cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('s')),
                      DataCell(Text('d')),DataCell(Text('e')),
                    ],
                  ), DataRow(
                    cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('s')),
                      DataCell(Text('d')),DataCell(Text('e')),
                    ],
                  ), DataRow(
                    cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('s')),
                      DataCell(Text('d')),DataCell(Text('e')),
                    ],
                  ), DataRow(
                    cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('s')),
                      DataCell(Text('d')),DataCell(Text('e')),
                    ],
                  ), DataRow(
                    cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('s')),
                      DataCell(Text('d')),DataCell(Text('e')),
                    ],
                  ), DataRow(
                    cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('John Doe')),
                      DataCell(Text('25')),
                      DataCell(Text('a')),
                      DataCell(Text('s')),
                      DataCell(Text('d')),DataCell(Text('e')),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
