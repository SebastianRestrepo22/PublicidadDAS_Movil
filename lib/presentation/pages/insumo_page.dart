import 'package:flutter/material.dart';
import 'package:publicidaddas_movil/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/insumo_card.dart';

class InsumosPage extends StatefulWidget {
  const InsumosPage({super.key});

  @override
  State<InsumosPage> createState() => _InsumosPageState();
}

class _InsumosPageState extends State<InsumosPage> {
  List<Map<String, dynamic>> insumos = [];
  List<Map<String, dynamic>> insumosFiltrados = [];
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchInsumos();
  }

  Future<void> fetchInsumos() async {
    try {
      final url = Uri.parse('http://localhost:3000/api/insumos');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        setState(() {
          insumos = data
              .map((e) => {
                    "nombre": e["Nombre"] ?? "",
                    "stock": e["Stock"] ?? 0,
                  })
              .toList();
          insumosFiltrados = insumos;
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No se pudieron cargar los insumos")),
        );
      }
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al cargar insumos: $e")),
      );
    }
  }

  void _buscarInsumo(String query) {
    setState(() {
      insumosFiltrados = insumos
          .where(
              (i) => i["nombre"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ---------- HEADER UNIFICADO ----------
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 140,
              decoration: const BoxDecoration(
                color: Color(0xFF243652),
                borderRadius: BorderRadius.only(
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
                            GestureDetector(
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
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'INSUMOS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          // ---------- CAMPO DE BÚSQUEDA ----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _buscarInsumo,
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

          const SizedBox(height: 20),

          // ---------- LISTA DE INSUMOS ----------
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : insumosFiltrados.isEmpty
                    ? const Center(child: Text("No se encontraron insumos"))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: insumosFiltrados.length,
                        itemBuilder: (context, index) {
                          final i = insumosFiltrados[index];
                          return InsumoCard(
                            nombre: i["nombre"],
                            cantidad: "${i["stock"]} unidades",
                            imagen:
                                "assets/images/insumo2.png", 
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
