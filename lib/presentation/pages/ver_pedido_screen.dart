import 'package:flutter/material.dart';
import 'package:publicidaddas_movil/main.dart';

class verPedidoPage extends StatelessWidget {
  const verPedidoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ==== HEADER ====
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
                          builder: (_) => const HomeScreen(initialIndex: 4),
                        ),
                      );
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'DETALLE PEDIDO',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 50),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // === CARD CLIENTE ===
                  Container(
                    width: 330,
                    height: 150,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(240, 240, 240, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Empresas S.A.S',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          'empresassas@gmail.com',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          'Fecha de registro',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          '21/04/25',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ==== DETALLES DEL PEDIDO ====
                  _detallePedidoExpansion(
                    numero: '01',
                    tipoDetalle: 'Insumo',
                    nombreInsumo: 'Vasos',
                    productoServicio: 'Productos',
                    cantidad: '50 unidades',
                    descripcion: 'Con pinzas',
                  ),
                  const SizedBox(height: 10),
                  _detallePedidoExpansion(
                    numero: '02',
                    tipoDetalle: 'Insumo',
                    nombreInsumo: 'Vasos',
                    productoServicio: 'Productos',
                    cantidad: '50 unidades',
                    descripcion: 'Con pinzas',
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

  // ==== EXPANSION TILE DETALLE ====
  Widget _detallePedidoExpansion({
    required String numero,
    required String tipoDetalle,
    required String nombreInsumo,
    required String productoServicio,
    required String cantidad,
    required String descripcion,
  }) {
    return Container(
      width: 330,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(240, 240, 240, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        leading: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(37, 57, 92, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            numero,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        title: Text(
          "Tipo Detalle: $tipoDetalle",
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Nombre: $nombreInsumo"),
        children: [
          ListTile(
            title: const Text("Producto/Servicio:"),
            trailing: Text(productoServicio),
          ),
          ListTile(
            title: const Text("Cantidad:"),
            trailing: Text(cantidad),
          ),
          ListTile(
            title: const Text("Descripción:"),
            trailing: Text(descripcion),
          ),
        ],
      ),
    );
  }
}
