import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/cita.dart';

class CitaTile extends StatelessWidget {
  final Cita cita;
  final VoidCallback onEdit;

  const CitaTile({
    super.key,
    required this.cita,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final fechaFormateada = DateFormat("dd/MM/yyyy").format(cita.fecha);

    return ListTile(
      title: Text(cita.titulo),
      subtitle: Text("${cita.descripcion} - $fechaFormateada"),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: onEdit,
      ),
    );
  }
}