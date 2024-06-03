// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: Center(child: Column(children: [Text('settings page')],)),));
  }
}