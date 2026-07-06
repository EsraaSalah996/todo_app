import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class TaskCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String status;
  final Color statusColor;

  const TaskCard({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    Color statusBackgroundColor;

    if (status == "Pending") {
      statusBackgroundColor = const Color(0xFFE3F2FD);
    } else if (status == "Done") {
      statusBackgroundColor = const Color(0xFFE8F5E9);
    } else {
      statusBackgroundColor = const Color(0xFFFFF3E0);
    }

    return Container(
      height: 145,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 18,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.bodyLargeStyle),

                const SizedBox(height: 6),

                Text(subtitle, style: AppTextStyle.hintStyle),

                const SizedBox(height: 14),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: statusBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.arrow_forward_ios, size: 22),
        ],
      ),
    );
  }
}
