// ignore_for_file: file_names

import 'package:depostok/CompanyList.dart';
import 'package:depostok/Constants.dart';
import 'package:depostok/Homesidebar.dart';
import 'package:depostok/MySales.dart';
import 'package:depostok/Route/src/home/main_example.dart';
import 'package:depostok/SellProduct.dart';
import 'package:depostok/SettingsPage.dart';
import 'package:depostok/WarehouseList.dart';
import 'package:depostok/notes.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:table_calendar/table_calendar.dart';

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
              drawer: HomeSidebarX(controller: _controller),
              body: Row(
                children: [
                  if (!isSmallScreen) HomeSidebarX(controller: _controller),
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

class _ScreensExample extends StatefulWidget {
  _ScreensExample({
    required this.controller,
  });

  final SidebarXController controller;

  @override
  State<_ScreensExample> createState() => _ScreensExampleState();
}

class _ScreensExampleState extends State<_ScreensExample> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = focusedDay;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: focusedDay,
      firstDate: DateTime(2015, 1, 1),
      lastDate: DateTime(2030, 3, 14),
    );
    if (picked != null && picked != focusedDay) {
      setState(() {
        focusedDay = picked;
        selectedDay = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        switch (widget.controller.selectedIndex) {
          case 0:
            return Scaffold(
              drawer: _buildSidebar(),
              body: Row(
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [
                        _buildCalendar(),
                        NotesSection(notes: notes[selectedDay] ?? [],onNotesChanged:  (updatedNotes) {
                  setState(() {
                    notes[selectedDay] = updatedNotes;
                  });
                },),
                        //_buildNotes(),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => _selectDate(context),
                child: Icon(Icons.calendar_today),
              ),
            );
          case 1:
            return const WarehouseList(); //Depo Bilgileri
          case 2:
            return const SellProduct(); //Ürün Satış
          case 3:
            return CompanyList(); //Firmalar
          case 4:
            return const MainPageExample(); //Güzergah
          case 5:
            return MySales(); //Satışlar
          case 6:
            return Settingspage(); // Ayarlar
          default:
            return const Text('default state');
        }
      },
    );
  }

  Widget _buildSidebar() {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: Colors.grey[850],
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[900]!),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue.withOpacity(0.37)),
          gradient: const LinearGradient(
            colors: [Colors.blueAccent, Colors.grey],
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
          size: 20),
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
      headerBuilder: (context, extended) {
        return const SizedBox(
          height: 100,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('LOGO'),
          ),
        );
      },
      items: const [
        SidebarXItem(icon: Icons.home, label: 'Ana Sayfa'),
        SidebarXItem(icon: Icons.warehouse, label: 'Depo Bilgileri'),
        SidebarXItem(icon: Icons.sell, label: 'Ürün Satış'),
        SidebarXItem(icon: Icons.business_center, label: 'Firmalar'),
        SidebarXItem(icon: Icons.route, label: 'Güzergah'),
        SidebarXItem(icon: Icons.attach_money, label: 'Satışlar'),
        SidebarXItem(icon: Icons.settings, label: 'Ayarlar'),
      ],
    );
  }

  Widget _buildCalendar() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Takvim',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: TableCalendar(
                headerStyle: const HeaderStyle(formatButtonVisible: false),
                locale: 'tr_TR',
                firstDay: DateTime.utc(2015, 1, 1),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: focusedDay,
                selectedDayPredicate: (day) => isSameDay(day, selectedDay),
                onDaySelected: (selectedDay, focusedDay) {
                  _onDaySelected(selectedDay, focusedDay);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*Widget _buildNotes() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Notlarım (${selectedDay.toLocal().toString().split(' ')[0]})',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: NotesSection(
                notes: notes[selectedDay] ?? [],
                onNotesChanged: (updatedNotes) {
                  setState(() {
                    notes[selectedDay] = updatedNotes;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }*/
}