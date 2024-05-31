// ignore_for_file: use_super_parameters, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class SimpleExample extends StatefulWidget {
  const SimpleExample({Key? key}) : super(key: key);

  @override
  _SimpleExampleState createState() => _SimpleExampleState();
}

class _SimpleExampleState extends State<SimpleExample> {
  late PageController controller;
  late int indexPage;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1);
    indexPage = controller.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("osm"),
      ),
      body: PageView(
        children: <Widget>[
          const Center(
            child: Text("page n1"),
          ),
          SimpleOSM(),
        ],
        controller: controller,
        onPageChanged: (p) {
          setState(() {
            indexPage = p;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        onTap: (p) {
          controller.animateToPage(p,
              duration: const Duration(milliseconds: 500), curve: Curves.linear);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "information",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: "contact",
          ),
        ],
      ),
    );
  }
}

class SimpleOSM extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SimpleOSMState();
}

class SimpleOSMState extends State<SimpleOSM>
    with AutomaticKeepAliveClientMixin {
  late MapController controller;

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initMapWithUserPosition: const UserTrackingOption(),
    );
  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);
    return OSMFlutter(
      controller: controller,
      osmOption: const OSMOption(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
