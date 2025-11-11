import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    // 🎨 Color & icon based on status
    Color bgColor;
    IconData statusIcon;
    Color iconColor;

    if (exam.isPassed) {
      bgColor = Colors.green.shade200;
      statusIcon = Icons.check_circle_rounded;
      iconColor = Colors.green.shade800;
    } else if (exam.dateTime.isAfter(DateTime.now())) {
      bgColor = Colors.yellow.shade200;
      statusIcon = Icons.access_time_filled;
      iconColor = Colors.orange.shade800;
    } else {
      bgColor = Colors.grey.shade300;
      statusIcon = Icons.help_outline;
      iconColor = Colors.grey.shade600;
    }

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white, // 🤍 white border
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(3, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          // 🔹 Card content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.subjectName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  const Icon(Icons.calendar_month, size: 25),
                  const SizedBox(width: 4),
                  Text(dateFormat.format(exam.dateTime)),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 25),
                  const SizedBox(width: 4),
                  Text(timeFormat.format(exam.dateTime)),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.room, size: 25),
                  const SizedBox(width: 4),
                  Flexible(child: Text(exam.rooms.join(', '))),
                ],
              ),
            ],
          ),

          // 🔸 Status icon bottom-right
          Positioned(
            bottom: 4,
            right: 4,
            child: Icon(
              statusIcon,
              color: iconColor,
              size: 50, // larger icon
            ),
          ),
        ],
      ),
    );
  }
}
