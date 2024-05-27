import 'package:depostok/CompanyCreate.dart';
import 'package:depostok/MySales.dart';
import 'package:depostok/SellProduct.dart';
import 'package:depostok/WarehouseList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('APPNAME'),
        centerTitle: true,
        actions: [],
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WarehouseList()),
                  );
                },
                child: Text('Depo Listesi'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CompanyCreate()),
                  );
                },
                child: Text('Satış Firması Oluştur'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SellProduct()),
                  );
                },
                child: Text('Ürün Sat'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MySales()),
                  );
                },
                child: Text('Satışlarım'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
