import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor; // Nuevo parámetro
  final String text;
  final VoidCallback? onTap;

  const SmallCard({
    super.key,
    required this.icon,
    this.iconColor = const Color(0xFF616161), // valor por defecto (gris)
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: iconColor), // aquí aplicamos el color
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
