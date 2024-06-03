// ignore_for_file: file_names, library_private_types_in_public_api, prefer_interpolation_to_compose_strings, avoid_print, use_key_in_widget_constructors

 
// company post işlemi
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class User {
  
  final String name;
  final String phone;
  final String owner;
  final String location;

  User({
    required this.name,
    required this.phone,
    required this.owner, 
    required this.location
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      phone: json['phone'],
      owner: json['owner'],
      location:  json['location'],
    );
  }
}

Future<User> createUser(String name, String phone, String owner, String location ) async {
  final response = await http.post(
    Uri.parse('http://10.102.123.119:3005/company'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'name': name,
      'phone': phone,
      'owner': owner,
      'location':location
    }),
  );

  print(response.body+'\n');
  print(response.statusCode);

  if (response.statusCode == 201 || response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create user');
  }
}

class CompanyCreate extends StatefulWidget {
  @override
  _CompanyCreateState createState() => _CompanyCreateState();
}

class _CompanyCreateState extends State<CompanyCreate> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ownerController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  Future<User>? _futureUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FİRMA EKLE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (_futureUser == null) ? buildForm() : buildFutureBuilder(),
      ),
    );
  }

  Form buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Firma Adı'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Firma Adı Giriniz';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Firma Numarası'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Firma Telefon Numarası Giriniz';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _ownerController,
            decoration: const InputDecoration(labelText: 'Firma iletişim Kişisi'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Firma İletişim Kişisi Giriniz';
              }
              return null;
            },
          ),TextFormField(
            controller: _locationController,
            decoration: const InputDecoration(labelText: 'Konumu'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Firmanın Konumunu Giriniz';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _futureUser = createUser(
                      _nameController.text,
                      _phoneController.text,
                      _ownerController.text,
                      _locationController.text,
                    );
                  });
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  FutureBuilder<User> buildFutureBuilder() {
    return FutureBuilder<User>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Text('User Created: ${snapshot.data!.name}');
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
