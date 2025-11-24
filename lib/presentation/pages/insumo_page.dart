import 'package:flutter/material.dart';
import 'package:publicidaddas_movil/main.dart';
import '../widgets/insumo_card.dart';

class InsumosPage extends StatelessWidget {
  const InsumosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final insumos = [
      {'imagen': 'assets/images/insumo1.png', 'nombre': 'Vasos', 'cantidad': '50 unidades'},
      {'imagen': 'assets/images/insumo2.png', 'nombre': 'Cuadernos', 'cantidad': '50 unidades'},
      {'imagen': 'assets/images/insumo3.png', 'nombre': 'Lapiceros', 'cantidad': '50 unidades'},
      {'imagen': 'assets/images/insumo4.png', 'nombre': 'Vasos', 'cantidad': '50 unidades'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ---------- APPBAR SUPERIOR ----------  
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFF243652),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(
                                  initialIndex: 2,
                                ),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'INSUMOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ),

          // ---------- CAMPO DE BÚSQUEDA ----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar insumos',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // ---------- LISTA DE INSUMOS ----------
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: insumos.length,
              itemBuilder: (context, index) {
                final item = insumos[index];
                return InsumoCard(
                  nombre: item['nombre']!,
                  cantidad: item['cantidad']!,
                  imagen: item['imagen']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
