import 'package:flutter/material.dart';
import 'package:publicidaddas_movil/main.dart';
import 'package:publicidaddas_movil/presentation/pages/login_screen.dart';

class perfilPage extends StatelessWidget {
  const perfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
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
                  margin: const EdgeInsets.all(20),
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
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/images/perfilImage.png',
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    'Administrador',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ), // centrado
                    child: Column(
                      children: [
                        // Nombre
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'Nombre completo:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[300],
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Sebastián Restrepo',
                              ),
                            ),
                          ],
                        ),

                        // Correo
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'Correo electronico:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[300],
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'admin@demo.com',
                              ),
                            ),
                          ],
                        ),

                        // Teléfono
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'Telefono:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[300],
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: '3218315458',
                              ),
                            ),
                          ],
                        ),

                        // Botón Salir
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(37, 57, 92, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Salir',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
