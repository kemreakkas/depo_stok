


// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:depostok/Route/src/home/main_example.dart';
import 'package:depostok/Route/src/search_example.dart';
import 'package:depostok/Route/src/simple_example_hook.dart';
import 'package:flutter/material.dart';

//import 'src/adv_home/home_example.dart';
import 'src/home/home_example.dart';



class RouteHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: "/home",
      routes: {
        "/home": (context) => MainPageExample(),
        "/old-home": (context) => OldMainExample(),
        "/hook": (context) => SimpleHookExample(),
        //"/adv-home": (ctx) => AdvandedMainExample(),
        // "/nav": (ctx) => MyHomeNavigationPage(
        //       map: Container(),
        // ),
        "/second": (context) => Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/old-home");
                  },
                  child: Text("another page"),
                ),
              ),
            ),
        "/picker-result": (context) => LocationAppExample(),
        "/search": (context) => SearchPage(),
      },
    );
  }
}

