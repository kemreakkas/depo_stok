// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:depostok/CompanyCreate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String phone;
  final String owner;
  final String location;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.owner, 
    required this.location
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      owner: json['owner'],
      location:  json['location'],
    );
  }
}

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('http://10.102.123.119:3005/company'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load company');
  }
}

class CompanyList extends StatefulWidget {
  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firma Listesi'),actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>   CompanyCreate()));
              },
              child: const Text('FİRMA EKLE')),
        ],
      ),
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<User> users = snapshot.data!;
            return SingleChildScrollView(
  child: DataTable(
    columns: const <DataColumn>[
      DataColumn(
        label: Text(
          'FİRMA ADI',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      DataColumn(
        label: Text(
          'FİRMA TELEFON',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      DataColumn(
        label: Text(
          'FİRMA SAHİBİ',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      DataColumn(
        label: Text(
          'KONUMU',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
    ],
    rows: users.map((user) {
      return DataRow(
        cells: <DataCell>[
          DataCell(Text(user.name)),
          DataCell(Text(user.phone)),
          DataCell(Text(user.owner)),
          DataCell(Text(user.location)),
        ],
      );
    }).toList(),
  ),
);

          } else {
            return const Text("No data available");
          }
        },
      ),
    );
  }
}