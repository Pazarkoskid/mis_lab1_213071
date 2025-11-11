import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  List<Exam> getExams() {
    return [
      Exam(subjectName: "Етика", dateTime: DateTime(2025, 11, 1, 9, 0), rooms: ["B1"], isPassed: true),
      Exam(subjectName: "Математика 1", dateTime: DateTime(2025, 11, 3, 10, 0), rooms: ["A1", "A2"], isPassed: true),
      Exam(subjectName: "Физика", dateTime: DateTime(2025, 11, 7, 9, 30), rooms: ["A3"], isPassed: true),
      Exam(subjectName: "Програмирање", dateTime: DateTime(2025, 11, 12, 12, 0), rooms: ["Lab 3"]),
      Exam(subjectName: "Оперативни системи", dateTime: DateTime(2025, 11, 15, 9, 0), rooms: ["B2"]),
      Exam(subjectName: "Бази на податоци", dateTime: DateTime(2025, 11, 18, 11, 0), rooms: ["Lab 1"]),
      Exam(subjectName: "Математика 2", dateTime: DateTime(2025, 11, 21, 9, 0), rooms: ["A4"]),
      Exam(subjectName: "Компјутерски мрежи", dateTime: DateTime(2025, 11, 24, 12, 0), rooms: ["C1"]),
      Exam(subjectName: "Веб технологии", dateTime: DateTime(2025, 11, 27, 10, 0), rooms: ["Lab 2"]),
      Exam(subjectName: "Вештачка интелигенција", dateTime: DateTime(2025, 11, 30, 9, 0), rooms: ["A1"]),
    ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    final exams = getExams();

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        centerTitle: true,
        elevation: 6,
        title: const Text(
          "Распоред за испити - 213071",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: exams.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final exam = exams[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam)),
              ),
              child: ExamCard(exam: exam),
            );
          },
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border(
              top: BorderSide(color: Colors.white,width: 3)
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, -2),

            ),
          ]
        ),


        padding: const EdgeInsets.all(14),
        child: Text(
          "Вкупно испити: ${exams.length}",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
