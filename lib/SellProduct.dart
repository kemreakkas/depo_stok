import 'package:flutter/material.dart';

class SellProduct extends StatefulWidget {
  @override
  State<SellProduct> createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Depo Listesi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
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
        ),
      ),
    );
  }
}
