// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
 

class MySales extends StatefulWidget {
  @override
  _MySalesState createState() => _MySalesState();
}

class _MySalesState extends State<MySales> {
  Map<DateTime, List<String>> notes = {};
  DateTime selectedDay = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Takvim',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: TableCalendar(headerStyle: const HeaderStyle(formatButtonVisible: false),
                        locale: 'tr_TR',
                        firstDay: DateTime.utc(2020, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: selectedDay,
                        selectedDayPredicate: (day) => isSameDay(day, selectedDay),
                        onDaySelected: _onDaySelected,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
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
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Satışlarım',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: HorizontalBarChart(
                        data: [50, 25], // Satış verileri
                        labels: ['Ürün A', 'Ürün B'], // Satış etiketleri
                        colors: [Colors.blue, Colors.red], // Çubuk renkleri
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Tamamlanan Müşteri',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: HorizontalBarChart(
                        data: [70, 20], // Tamamlanan müşteri verileri
                        labels: ['Müşteri A', 'Müşteri B'], // Müşteri etiketleri
                        colors: [Colors.green, Colors.orange], // Çubuk renkleri
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotesSection extends StatefulWidget {
  final List<String> notes;
  final ValueChanged<List<String>> onNotesChanged;

  const NotesSection({required this.notes, required this.onNotesChanged});

  @override
  _NotesSectionState createState() => _NotesSectionState();
}

class _NotesSectionState extends State<NotesSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.notes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: TextField(
                  controller: TextEditingController(text: widget.notes[index]),
                  onChanged: (text) {
                    setState(() {
                      widget.notes[index] = text;
                    });
                    widget.onNotesChanged(widget.notes);
                  },
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      widget.notes.removeAt(index);
                    });
                    widget.onNotesChanged(widget.notes);
                  },
                ),
              );
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Yeni Not Ekle'),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  widget.notes.add(_controller.text);
                  _controller.clear();
                });
                widget.onNotesChanged(widget.notes);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class HorizontalBarChart extends StatelessWidget {
  final List<double> data;
  final List<String> labels;
  final List<Color> colors;

  const HorizontalBarChart({required this.data, required this.labels, required this.colors});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HorizontalBarChartPainter(data: data, labels: labels, colors: colors),
      child: Container(),
    );
  }
}

class HorizontalBarChartPainter extends CustomPainter {
  final List<double> data;
  final List<String> labels;
  final List<Color> colors;

  HorizontalBarChartPainter({required this.data, required this.labels, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    final maxData = data.reduce((a, b) => a > b ? a : b);
    final barHeight = size.height / (data.length * 2);

    for (int i = 0; i < data.length; i++) {
      paint.color = colors[i];
      final barWidth = (data[i] / maxData) * size.width;
      final y = i * 2 * barHeight + barHeight / 2;

      // Draw bar
      canvas.drawRect(
        Rect.fromLTWH(0, y, barWidth, barHeight),
        paint,
      );

      // Draw labels
      final textPainter = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
        canvas,
        Offset(barWidth + 4, y + barHeight / 2 - textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
