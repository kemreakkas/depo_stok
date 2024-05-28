// ignore_for_file: file_names

import 'package:depostok/CompanyList.dart';
import 'package:depostok/Constants.dart';
import 'package:depostok/MySales.dart';
import 'package:depostok/RoutePage.dart';
import 'package:depostok/SellProduct.dart';
import 'package:depostok/SettingsPage.dart';
import 'package:depostok/WarehouseList.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SidebarX Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return SafeArea(
            child: Scaffold(
              key: _key,
              appBar: isSmallScreen
                  ? AppBar(
                      backgroundColor: canvasColor,
                      title: Text(_getTitleByIndex(_controller.selectedIndex)),
                      leading: IconButton(
                        onPressed: () {
                          // if (!Platform.isAndroid && !Platform.isIOS) {
                          //   _controller.setExtended(true);
                          // }
                          _key.currentState?.openDrawer();
                        },
                        icon: const Icon(Icons.menu),
                      ),
                    )
                  : null,
              drawer: ExampleSidebarX(controller: _controller),
              body: Row(
                children: [
                  if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                  Expanded(
                    child: Center(
                      child: _ScreensExample(
                        controller: _controller,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/avatar.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Ana Sayfa',
          onTap: () {
            debugPrint('Home');
          },
        ),
        const SidebarXItem(
          icon: Icons.warehouse,
          label: 'Depo Bilgileri',
        ),
        const SidebarXItem(
          icon: Icons.sell,
          label: 'Ürün Satış',
        ),
        SidebarXItem(
          icon: Icons.business_center,
          label: 'Firmalar',
           onTap: () => _showDisabledAlert(context),
        ),
        SidebarXItem(
          icon: Icons.route,
          label: 'Güzergah',
           onTap: () => _showDisabledAlert(context),
        ),
        SidebarXItem(
          icon: Icons.attach_money,
          label: 'Satışlar',
           onTap: () => _showDisabledAlert(context),
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: 'Ayarlar',
           onTap: () => _showDisabledAlert(context),
        ),
      ],
    );
  }

  void _showDisabledAlert(BuildContext context) {}
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    required this.controller,
  });

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                  boxShadow: const [BoxShadow()],
                ),
              ),
            );
          case 1:
            return const WarehouseList(); //Depo Bilgileri
          case 2:
            return const SellProduct(); //Ürün Satış
          case 3:
            return const CompanyList(); //Firmalar
          case 4:
            return Routepage(); //Güzergah
          case 5:
            return const MySales(); //Satışlar
          case 6:
            return const Settingspage(); //Ayarlar
          default:
            return const Text('default state');
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}

