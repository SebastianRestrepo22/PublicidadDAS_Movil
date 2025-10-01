import 'package:flutter/material.dart';

class InsumoCard extends StatelessWidget {
  final String nombre;
  final String cantidad;
  final String imagen;

  const InsumoCard({
    super.key,
    required this.nombre,
    required this.cantidad,
    required this.imagen, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        // Espacio reservado para imágenes
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              image: AssetImage(imagen), // <-- aquí va la imagen
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          nombre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(cantidad),
        trailing: const CircleAvatar(
          backgroundColor: Colors.green,
          radius: 14,
          child: Icon(Icons.check, color: Colors.white, size: 16),
        ),
      ),
    );
  }
}