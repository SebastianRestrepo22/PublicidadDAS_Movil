import 'package:flutter/material.dart';
import 'package:publicidaddas_movil/main.dart';

class ventasPage extends StatelessWidget {
  const ventasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Encabezado
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(37, 57, 92, 1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(25),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const HomeScreen(initialIndex: 2),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'VENTAS',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // LISTA DE VENTAS
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // INPUT BUSQUEDA
                  Container(
                    width: 300,
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(240, 240, 240, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Buscar ventas",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        Image.asset(
                          'assets/images/lupa.png',
                          width: 15,
                          height: 15,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // CARDS REPRESENTANDO LA TABLA REAL (VentaId, Fecha, Total, Estado)
                  _VentaCard(
                    nombre: "#A4523",
                    fecha: "2025-02-10",
                    total: 12000,
                    estado: "Pagada",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(initialIndex: 11),
                        ),
                      );
                    },
                  ),

                  _VentaCard(
                    nombre: "#X9231",
                    fecha: "2025-02-08",
                    total: 45000,
                    estado: "Cancelada",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(initialIndex: 11),
                        ),
                      );
                    },
                  ),

                  _VentaCard(
                    nombre: "#T8821",
                    fecha: "2025-02-05",
                    total: 18000,
                    estado: "Pendiente",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(initialIndex: 11),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// WIDGET DE CARD DE VENTA 


class _VentaCard extends StatelessWidget {
  final String nombre;
  final String fecha;
  final double total;
  final String estado;
  final VoidCallback onTap;

  const _VentaCard({
    required this.nombre,
    required this.fecha,
    required this.total,
    required this.estado,
    required this.onTap,
  });

  Color _estadoColor() {
    switch (estado) {
      case "Pagada":
        return const Color.fromARGB(255, 81, 218, 86);
      case "Cancelada":
        return const Color.fromARGB(255, 255, 112, 102);
      default:
        return const Color.fromARGB(255, 255, 195, 75); // Pendiente
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // DATOS
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombre,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Fecha: $fecha",
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              Text(
                "\$${total.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromRGBO(37, 57, 92, 1),
                ),
              ),
            ],
          ),

          // ESTADO Y FLECHA
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: _estadoColor(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  estado,
                  style: const TextStyle(fontSize: 11, color: Colors.black),
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  'assets/images/flecha.png',
                  width: 20,
                  height: 20,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
