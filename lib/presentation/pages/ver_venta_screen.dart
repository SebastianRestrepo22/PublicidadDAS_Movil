import 'package:flutter/material.dart';
import 'package:publicidaddas_movil/main.dart';

class verVentaPage extends StatelessWidget {
  const verVentaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 140,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(37, 57, 92, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(initialIndex: 2),
                        ),
                      );
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'DETALLE VENTA',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // MASTER USANDO TABLA VENTAS
                  Container(
                    width: 330,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "VENTA #A4523", // VentaId
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Fecha Venta:",
                                style: TextStyle(color: Colors.grey)),
                            Text("2025-02-10"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("IVA:",
                                style: TextStyle(color: Colors.grey)),
                            Text("19%"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Total:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 81, 218, 86))),
                            Text("\$12,000.00",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 81, 218, 86))),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Pagada",
                            style: TextStyle(fontSize: 11, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // DETALLE DESPLEGABLES USANDO TABLA DETALLEVENTAS
                  _DetalleVentaItem(
                    index: 1,
                    nombreProducto: "Calendario Personalizado",
                    cantidad: 10,
                    precioUnitario: 1200,
                    descuento: 5,
                    subtotal: 11400,
                  ),
                  _DetalleVentaItem(
                    index: 2,
                    nombreProducto: "Llavero Acrílico",
                    cantidad: 5,
                    precioUnitario: 800,
                    descuento: 0,
                    subtotal: 4000,
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// **************************************
// WIDGET DE DETALLE USANDO TABLA DETALLEVENTAS
// **************************************

class _DetalleVentaItem extends StatelessWidget {
  final int index;
  final String nombreProducto;
  final int cantidad;
  final double precioUnitario;
  final double descuento;
  final double subtotal;

  const _DetalleVentaItem({
    required this.index,
    required this.nombreProducto,
    required this.cantidad,
    required this.precioUnitario,
    required this.descuento,
    required this.subtotal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(240, 240, 240, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        leading: CircleAvatar(
          radius: 14,
          backgroundColor: const Color.fromRGBO(37, 57, 92, 1),
          child: Text(
            index.toString().padLeft(2, "0"),
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        title: Text(
          "Producto/Servicio: $nombreProducto",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Cantidad: $cantidad"),
        children: [
          ListTile(
            title: const Text("Precio Unitario:"),
            trailing: Text("\$${precioUnitario.toStringAsFixed(2)}"),
          ),
          ListTile(
            title: const Text("Descuento:"),
            trailing: Text("${descuento.toStringAsFixed(2)}%"),
          ),
          const Divider(),
          ListTile(
            title: const Text("Subtotal"),
            trailing: Text(
              "\$${subtotal.toStringAsFixed(2)}",
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
