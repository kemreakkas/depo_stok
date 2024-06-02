// ignore_for_file: file_names
/*
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
    throw Exception('Failed to load users');
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
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
        title: Text('User List'),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<User> users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index].name),
                    //subtitle: Text(users[index].phone),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
*/


// post işlemi
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
    Uri.parse('http://192.168.1.34:3001/company'),
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

class UserFormScreen extends StatefulWidget {
  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
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
        title: Text('Create User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(labelText: '_phoneController'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a username';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _ownerController,
            decoration: InputDecoration(labelText: '_ownerController'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              return null;
            },
          ),TextFormField(
            controller: _locationController,
            decoration: InputDecoration(labelText: 'locati'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
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
              child: Text('Submit'),
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
        return CircularProgressIndicator();
      },
    );
  }
}
