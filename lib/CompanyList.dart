// ignore_for_file: file_names

import 'package:depostok/CompanyCreate.dart';
import 'package:depostok/Constants.dart';
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
  final response = await http.get(Uri.parse('http://192.168.1.34:3001/company'));

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
        title: Text('Firma Listesi'),actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CompanyCreate2()));
              },
              child: const Text('FİRMA EKLE')),
        ],
      ),
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<User> users = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: users.map((user) {
                  return /*Row(children: [
                    Text(user.name),
                    Text('Phone: ${user.phone}'),
                    Text('Owner: ${user.owner}'),
                    Text('Location: ${user.location}'),]);*/
                  ListTile(
                    title: Text(user.name),
                    subtitle: Text('Phone: ${user.phone} Owner: ${user.owner} Location: ${user.location}'),
                   
                   // isThreeLine: true,
                  );
                }).toList(),
              ),
            );
          } else {
            return Text("No data available");
          }
        },
      ),
    );
  }
}