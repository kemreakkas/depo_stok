import 'package:flutter/material.dart';

class CompanyCreate extends StatefulWidget {
  const CompanyCreate({super.key});

  @override
  _CompanyCreateState createState() => _CompanyCreateState();
}

class _CompanyCreateState extends State<CompanyCreate> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();

  void _submitData() {
    final String input1 = _controller1.text;
    final String input2 = _controller2.text;
    final String input3 = _controller3.text;
    final String input4 = _controller4.text;
    final String input5 = _controller5.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Satış Firması Oluştur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Kayıtlı olmayan bir firma ekle'),
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(labelText: 'Firma Adı'),
            ),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(labelText: 'Firma İletişim Kişi Adı'),
            ),
            TextField(
              controller: _controller3,
              decoration: const InputDecoration(labelText: 'Firma Konumu'),
            ),
            TextField(
              controller: _controller4,
              decoration: const InputDecoration(labelText: 'Input 4'),
            ),
            TextField(
              controller: _controller5,
              decoration: const InputDecoration(labelText: 'Input 5'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text('Oluştur'),
            ),
          ],
        ),
      ),
    );
  }
}
