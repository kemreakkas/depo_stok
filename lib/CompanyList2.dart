
 // ignore_for_file: file_names, avoid_print
 
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';


class CompanyList2 extends StatelessWidget {
  CompanyList2({super.key});

  final List<Employee> employees = Employee.getEmployees;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      body: TableView.builder(
          columnCount: 4,
          rowCount: 21, //TO DO: gelen data içinden satır sayısını ekle
          columnBuilder: buildColumnSpan,
          rowBuilder: buildTableSpan,
          pinnedRowCount: 1,
          pinnedColumnCount: 0,
          diagonalDragBehavior: DiagonalDragBehavior.none,
          cellBuilder: (BuildContext context, TableVicinity vicinity) {
            return TableViewCell (child: addText(vicinity));
          }),
    );
  }
  
    TableSpan buildColumnSpan(int index) {
    TableSpanDecoration decoration = const TableSpanDecoration(consumeSpanPadding: true,
        border: TableSpanBorder(
            trailing: BorderSide(color: Colors.black),
            leading: BorderSide(color: Colors.black)));
    if (index == 2) {
      return TableSpan(
        extent: const RemainingTableSpanExtent(),
        backgroundDecoration: decoration,
      );
    } else if (index == 3) {
      return TableSpan(
        extent: const FractionalTableSpanExtent(0.25),
        backgroundDecoration: decoration,
      );
    }
    return TableSpan(
        extent: const FixedTableSpanExtent(100),
        backgroundDecoration: decoration);
  }

  TableSpan buildTableSpan(int index) {
    TableSpanDecoration foreGroundDecoration = const TableSpanDecoration(
        border: TableSpanBorder(
            trailing: BorderSide(color: Colors.black),
            leading: BorderSide(color: Colors.black)));
    TableSpanDecoration backGroundDecoration = TableSpanDecoration(
      color: index == 0 ? const Color.fromARGB(255, 129, 109, 109) : null,
    );
    return TableSpan(
        extent: const FixedTableSpanExtent(100),
        backgroundDecoration: backGroundDecoration,
        foregroundDecoration: foreGroundDecoration,
        recognizerFactories: <Type, GestureRecognizerFactory>{
          TapGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
                  () => TapGestureRecognizer(), (TapGestureRecognizer t) {
            t.onTap = () {
              print("Tapping on Row $index");
            };
          })
        },
        onEnter: (PointerEnterEvent event) {
          print("Row OnEnter: $index ${event.localPosition} ");
        },
        onExit: (PointerExitEvent event) {
          print("Row OnExit: $index ${event.localPosition} ");
        });
  }
  
  //Sample code for CombiningTableSpanExtent 
  
    TableSpan buildRowSpan(int index) {
    TableSpanExtent extent1 = const FixedTableSpanExtent(100);
    TableSpanExtent extent2 = const FixedTableSpanExtent(100);
    double combiner(double value1, double value2) {
      return value1 + value2;
    }

    TableSpanDecoration foreGroundDecoration = const TableSpanDecoration(
        border: TableSpanBorder(
            trailing: BorderSide(color: Colors.black),
            leading: BorderSide(color: Colors.black)));
    TableSpanDecoration backGroundDecoration = TableSpanDecoration(
      color: index == 0 ? Colors.grey[300] : null,
    );
    if (index == 1) {
      return TableSpan(
          extent: CombiningTableSpanExtent(extent1, extent2, combiner),
          backgroundDecoration: backGroundDecoration,
          foregroundDecoration: foreGroundDecoration);
    }
    return TableSpan(
        extent: const FixedTableSpanExtent(10),
        backgroundDecoration: backGroundDecoration,
        foregroundDecoration: foreGroundDecoration);
  }

  
  

  Widget addText(TableVicinity vicinity) {
    if (vicinity.yIndex == 0 && vicinity.xIndex == 0) {
      return const Text("Index");
    } else if (vicinity.yIndex == 0 && vicinity.xIndex == 1) {
      return const Text("name");
    } else if (vicinity.yIndex == 0 && vicinity.xIndex == 2) {
      return const Text("Email");
    } else if (vicinity.yIndex == 0 && vicinity.xIndex == 3) {
      return const Text("Role");
    } else if (vicinity.xIndex == 0) {
      return Text(employees[vicinity.yIndex - 1].id);
    } else if (vicinity.xIndex == 1) {
      return Text(employees[vicinity.yIndex - 1].name);
    } else if (vicinity.xIndex == 2) {
      return Text(employees[vicinity.yIndex - 1].email);
    } else if (vicinity.xIndex == 3) {
      return Text(employees[vicinity.yIndex - 1].role);
    }
    return const Text("");
  }
}

class Employee {
  final String id;
  final String name;
  final String role;
  final String email;

  Employee(
      {required this.id,
      required this.name,
      required this.role,
      required this.email});

  static get getEmployees {
    return [
      Employee(
          id: '1',
          name: 'John Doe',
          role: 'Manager',
          email: 'john@example.com'),
      Employee(
          id: '2',
          name: 'Jane Smith',
          role: 'Developer',
          email: 'jane@example.com'),
      Employee(
          id: '3',
          name: 'Mike Johnson',
          role: 'Designer',
          email: 'mike@example.com'),
      Employee(
          id: '4',
          name: 'Emily Brown',
          role: 'HR Specialist',
          email: 'emily@example.com'),
      Employee(
          id: '5',
          name: 'Alex Lee',
          role: 'Marketing Analyst',
          email: 'alex@example.com'),
      Employee(
          id: '6',
          name: 'John Doe',
          role: 'Manager',
          email: 'john@example.com'),
      Employee(
          id: '7',
          name: 'Jane Smith',
          role: 'Developer',
          email: 'jane@example.com'),
      Employee(
          id: '8',
          name: 'Mike Johnson',
          role: 'Designer',
          email: 'mike@example.com'),
      Employee(
          id: '9',
          name: 'Emily Brown',
          role: 'HR Specialist',
          email: 'emily@example.com'),
      Employee(
          id: '10',
          name: 'Alex Lee',
          role: 'Marketing Analyst',
          email: 'alex@example.com'),
      Employee(
          id: '1',
          name: 'John Doe',
          role: 'Manager',
          email: 'john@example.com'),
      Employee(
          id: '2',
          name: 'Jane Smith',
          role: 'Developer',
          email: 'jane@example.com'),
      Employee(
          id: '3',
          name: 'Mike Johnson',
          role: 'Designer',
          email: 'mike@example.com'),
      Employee(
          id: '4',
          name: 'Emily Brown',
          role: 'HR Specialist',
          email: 'emily@example.com'),
      Employee(
          id: '5',
          name: 'Alex Lee',
          role: 'Marketing Analyst',
          email: 'alex@example.com'),
      Employee(
          id: '6',
          name: 'John Doe',
          role: 'Manager',
          email: 'john@example.com'),
      Employee(
          id: '7',
          name: 'Jane Smith',
          role: 'Developer',
          email: 'jane@example.com'),
      Employee(
          id: '8',
          name: 'Mike Johnson',
          role: 'Designer',
          email: 'mike@example.com'),
      Employee(
          id: '9',
          name: 'Emily Brown',
          role: 'HR Specialist',
          email: 'emily@example.com'),
      Employee(
          id: '10',
          name: 'Alex Lee',
          role: 'Marketing Analyst',
          email: 'alex@example.com'),
    ];
  }
}