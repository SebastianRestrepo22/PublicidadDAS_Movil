import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Map<String, dynamic> evento;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const EventCard({
    super.key,
    required this.evento,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.indigo[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                evento["fecha"].toString().split("/")[0],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text("Día", style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
        title: Text(
          evento["nombre"]?.toString() ?? "",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(evento["servicio"]?.toString() ?? ""),
            Text("Hora: ${evento["hora"]?.toString() ?? ""}"),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.indigo),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}