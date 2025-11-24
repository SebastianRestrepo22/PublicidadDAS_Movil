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
          // === HEADER con SafeArea ===
          SafeArea(
            child: Container(
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
                  const Text(
                    'Administrador',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _campoPerfil('Nombre completo:', 'Sebastián Restrepo'),
                    _campoPerfil('Correo electronico:', 'admin@demo.com'),
                    _campoPerfil('Telefono:', '3218315458'),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // === Helper para campos de perfil ===
  Widget _campoPerfil(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
