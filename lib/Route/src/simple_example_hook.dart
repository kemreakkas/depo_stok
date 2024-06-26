// ignore_for_file: use_super_parameters, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
//import 'package:osm_flutter_hooks/osm_flutter_hooks.dart';

class SimpleHookExample extends StatefulWidget {
  const SimpleHookExample({Key? key}) : super(key: key);

  @override
  _SimpleExampleState createState() => _SimpleExampleState();
}

class _SimpleExampleState extends State<SimpleHookExample> {
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
        title: const Text("osm simple hook"),
      ),
      body: SimpleOSM(),
    );
  }
}

class SimpleOSM extends HookWidget {
  @override
  Widget build(BuildContext context) {
   /* final controller = useMapController(
        initPosition: GeoPoint(
      latitude: 47.4358055,
      longitude: 8.4737324,
    ));
    useMapIsReady(
      controller: controller,
      mapIsReady: () async {
        await controller.setZoom(zoomLevel: 15);
      },
    );*/
    return OSMFlutter(
      controller: MapController.withUserPosition(),
      osmOption: const OSMOption(),
    );
  }
}
