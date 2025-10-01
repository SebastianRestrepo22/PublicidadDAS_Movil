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
            decoration: BoxDecoration(
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
                  alignment: Alignment
                      .centerLeft, // asegura que el icono quede a la izquierda
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
                const SizedBox(height: 20), // separación entre icono y título
                const Text(
                  'DETALLE VENTA',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center, // centra el texto
                ),
              ],
            ),
          ),

          SizedBox(height: 50),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 330,
                    height: 150,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vanessa Perea',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Cedula ID : 1022954574',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: null,
                              ),
                            ),
                            Text(
                              '\$12,000',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  Container(
                    width: 330,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: ExpansionTile(
                      leading: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(37, 57, 92, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '01',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      title: const Text(
                        "Nombre Producto/Servicio: Calendario",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text("Tipo: Producto"),
                      children: [
                        // Secciones desplegables
                        ListTile(
                          title: const Text("Descripción:"),
                          trailing: const Text("Con pinzas"),
                        ),
                        ListTile(
                          title: const Text("Cantidad:"),
                          trailing: const Text("10 unidades"),
                        ),
                        ListTile(
                          title: const Text("Alto:"),
                          trailing: const Text("10 cm"),
                        ),
                        ListTile(
                          title: const Text("Ancho:"),
                          trailing: const Text("5 cm"),
                        ),
                        ListTile(
                          title: const Text("Descuento:"),
                          trailing: const Text("5%"),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Color.fromRGBO(37, 57, 92, 1),
                            child: Text(
                              "01",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: const Text(
                            "Nombre del insumo: Tinta de sublimación",
                          ),
                          subtitle: const Text("Cantidad usada: 3"),
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Color.fromRGBO(37, 57, 92, 1),
                            child: Text(
                              "02",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: const Text(
                            "Nombre del insumo: Papel de sublimación",
                          ),
                          subtitle: const Text("Cantidad usada: 3"),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
