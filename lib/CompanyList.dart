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
                        builder: (context) => const CompanyCreate()));
              },
              child: const Text('Firma Ekle')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [




              DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'ID',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'ADI',
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
                      'SORUMLU',
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
                      DataCell(Text('Developer')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('2')),
                      DataCell(Text('Jane Smith')),
                      DataCell(Text('30')),
                      DataCell(Text('Designer')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('3')),
                      DataCell(Text('Alex Johnson')),
                      DataCell(Text('28')),
                      DataCell(Text('Manager')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('4')),
                      DataCell(Text('Chris Lee')),
                      DataCell(Text('22')),
                      DataCell(Text('Intern')),
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
