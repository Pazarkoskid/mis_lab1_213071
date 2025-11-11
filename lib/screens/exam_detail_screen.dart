import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  String timeUntilExam() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    if (diff.isNegative) return "✅ Испитот веќе помина.";
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return "⏰ $days дена, $hours часа до испитот.";
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm');
    final bgColor = exam.isPassed ? Colors.green.shade50 : Colors.yellow.shade50;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(exam.subjectName),
        backgroundColor: exam.isPassed ? Colors.green : Colors.yellow,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("📘 Предмет: ${exam.subjectName}",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(children: [
              const Icon(Icons.calendar_today),
              const SizedBox(width: 6),
              Text("Датум и време: ${dateFormat.format(exam.dateTime)}"),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              const Icon(Icons.room),
              const SizedBox(width: 6),
              Text("Простории: ${exam.rooms.join(', ')}"),
            ]),
            const SizedBox(height: 20),
            Text(
              timeUntilExam(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
