import 'package:flutter/material.dart';
import 'package:publicidaddas_movil/main.dart';
import 'package:publicidaddas_movil/presentation/pages/login_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class perfilPage extends StatefulWidget {
  const perfilPage({super.key});

  @override
  State<perfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<perfilPage> {
  Map<String, dynamic>? userData;

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    if (token == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
      return;
    }

    try {
      final decodedToken = JwtDecoder.decode(token);
      final userId = decodedToken['CedulaId'];

      // === Cambiado localhost → 10.0.2.2 para Android Emulator ===
      final url = Uri.parse('http://10.0.2.2:3000/usuarios/$userId');

      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          userData = data;
          nombreController.text = data['NombreCompleto'] ?? '';
          correoController.text = data['CorreoElectronico'] ?? '';
          telefonoController.text = data['Telefono'] ?? '';
          direccionController.text = data['Direccion'] ?? '';
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No se pudieron cargar los datos del usuario")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al cargar datos: $e")),
      );
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  Future<void> updateUser() async {
    if (userData == null) return;

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    final url = Uri.parse('http://10.0.2.2:3000/usuarios/${userData!['CedulaId']}');

    final payload = {
      'NombreCompleto': nombreController.text.trim(),
      'CorreoElectronico': correoController.text.trim(),
      'Telefono': telefonoController.text.trim(),
      'Direccion': direccionController.text.trim(),
    };

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Usuario actualizado correctamente")),
        );
        fetchUserData();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No se pudo actualizar el usuario")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al actualizar: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final azulFondo = const Color.fromRGBO(37, 57, 92, 1);

    if (userData == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
                  Image.asset('assets/images/perfilImage.png', width: 100, height: 80),
                  Text(
                    userData?['RoleNombre'] ?? 'Cargando...',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
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
                    _campoEditable('Nombre completo', nombreController),
                    _campoEditable('Correo electrónico', correoController),
                    _campoEditable('Teléfono', telefonoController),
                    _campoEditable('Dirección', direccionController),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: updateUser,
                          style: ElevatedButton.styleFrom(backgroundColor: azulFondo),
                          child: const Text("Actualizar"),
                        ),
                        ElevatedButton(
                          onPressed: logout,
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          child: const Text("Salir"),
                        ),
                      ],
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

  Widget _campoEditable(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
