import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String number;
  final String text;
  final VoidCallback? onTap; // <-- aquí agregamos onTap opcional

  const BigCard({
    super.key,
    required this.color,
    required this.icon,
    required this.number,
    required this.text,
    this.onTap, // <-- se pasa al constructor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // <-- ya puedes usarlo
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 8),
            Text(number,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 4),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}