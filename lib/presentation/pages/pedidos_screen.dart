import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:publicidaddas_movil/main.dart';

class pedidosPage extends StatelessWidget {
  const pedidosPage({super.key});

  // === Modal para editar (centrado) ===
  void _abrirModalEditar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Editar Pedido",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text('Tipo de detalle:'),
                        TextField(
                          decoration: InputDecoration(
                            labelText:
                                "Tipo de detalle", // texto que aparece arriba al escribir
                            filled: true, // fondo gris
                            fillColor: Colors.grey[300],
                            isDense: true, // reduce altura
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ), // ajusta padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // sin borde
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text('Nombre:'),
                        TextField(
                          decoration: InputDecoration(
                            labelText:
                                "Nombre", // texto que aparece arriba al escribir
                            filled: true, // fondo gris
                            fillColor: Colors.grey[300],
                            isDense: true, // reduce altura
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ), // ajusta padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // sin borde
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text('Producto/servicio:'),
                        TextField(
                          decoration: InputDecoration(
                            labelText:
                                "Producto/servicio", // texto que aparece arriba al escribir
                            filled: true, // fondo gris
                            fillColor: Colors.grey[300],
                            isDense: true, // reduce altura
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ), // ajusta padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // sin borde
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text('Cantidad:'),
                        TextField(
                          decoration: InputDecoration(
                            labelText:
                                "Cantidad", // texto que aparece arriba al escribir
                            filled: true, // fondo gris
                            fillColor: Colors.grey[300],
                            isDense: true, // reduce altura
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ), // ajusta padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // sin borde
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text('Descripción:'),
                        TextField(
                          decoration: InputDecoration(
                            labelText:
                                "Descripción", // texto que aparece arriba al escribir
                            filled: true, // fondo gris
                            fillColor: Colors.grey[300],
                            isDense: true, // reduce altura
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ), // ajusta padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // sin borde
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF25395C), // color del botón
                      foregroundColor: Colors.white, // color del texto
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancelar"),
                  ),
                ),
                SizedBox(width: 10), // separación entre botones
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF25395C), // color del botón
                      foregroundColor: Colors.white, // color del texto
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    onPressed: () {
                      // Guardar cambios aquí
                      Navigator.pop(context);
                    },
                    child: const Text("Editar"),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // === Modal para crear (centrado) ===
  void _abrirModalCrear(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Nuevo Pedido",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text('Tipo de detalle:'),
                        TextField(
                          decoration: InputDecoration(
                            labelText:
                                "Tipo de detalle", // texto que aparece arriba al escribir
                            filled: true, // fondo gris
                            fillColor: Colors.grey[300],
                            isDense: true, // reduce altura
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ), // ajusta padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // sin borde
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text('Nombre:'),
                        TextField(
                          decoration: InputDecoration(
                            labelText:
                                "Nombre", // texto que aparece arriba al escribir
                            filled: true, // fondo gris
                            fillColor: Colors.grey[300],
                            isDense: true, // reduce altura
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ), // ajusta padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // sin borde
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text('Producto/servicio:'),
                        TextField(
                          decoration: InputDecoration(
                            labelText:
                                "Producto/servicio", // texto que aparece arriba al escribir
                            filled: true, // fondo gris
                            fillColor: Colors.grey[300],
                            isDense: true, // reduce altura
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ), // ajusta padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // sin borde
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text('Cantidad:'),
                        TextField(
                          decoration: InputDecoration(
                            labelText:
                                "Cantidad", // texto que aparece arriba al escribir
                            filled: true, // fondo gris
                            fillColor: Colors.grey[300],
                            isDense: true, // reduce altura
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ), // ajusta padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // sin borde
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text('Descripción:'),
                        TextField(
                          decoration: InputDecoration(
                            labelText:
                                "Descripción", // texto que aparece arriba al escribir
                            filled: true, // fondo gris
                            fillColor: Colors.grey[300],
                            isDense: true, // reduce altura
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ), // ajusta padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none, // sin borde
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF25395C), // color del botón
                      foregroundColor: Colors.white, // color del texto
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancelar"),
                  ),
                ),
                SizedBox(width: 10), // separación entre botones
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF25395C), // color del botón
                      foregroundColor: Colors.white, // color del texto
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    onPressed: () {
                      // Guardar cambios aquí
                      Navigator.pop(context);
                    },
                    child: const Text("Guardar"),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // === Modal para eliminar (centrado) ===
  void _abrirModalEliminar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40),
              Container(
                child: Text(
                  '¿Esta seguro de eliminar el pedido?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF25395C), // color del botón
                      foregroundColor: Colors.white, // color del texto
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cerrar"),
                  ),
                ),
                SizedBox(width: 10), // separación entre botones
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF25395C), // color del botón
                      foregroundColor: Colors.white, // color del texto
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    onPressed: () {
                      // Guardar cambios aquí
                      Navigator.pop(context);
                    },
                    child: const Text("Eliminar"),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // === HEADER ===
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
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(25),
                            child: Column(
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
                          ),
                        ],
                      ),
                      const Text(
                        'PEDIDOS',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 50),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // === LISTA DE PEDIDOS ===
                  Container(
                    width: 330,
                    height: 120,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 235, 235),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Empresas S.A.S',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'empresassas@gmail.com',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'Fecha de registro',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '21/04/25',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 81, 218, 86),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Confirmado',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const HomeScreen(initialIndex: 10),
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Symbols.visibility,
                                    size: 20,
                                    color: Color.fromARGB(255, 22, 94, 24),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                // === EDITAR abre modal centrado ===
                                GestureDetector(
                                  onTap: () => _abrirModalEditar(context),
                                  child: const Icon(
                                    Symbols.edit,
                                    size: 20,
                                    color: Color.fromARGB(255, 12, 67, 112),
                                  ),
                                ),

                                const SizedBox(width: 10),

                                GestureDetector(
                                  onTap: () => _abrirModalEliminar(context),
                                  child: const Icon(
                                    Symbols.delete,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    width: 330,
                    height: 120,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 235, 235),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Empresas S.A.S',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'empresassas@gmail.com',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'Fecha de registro',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '21/04/25',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 81, 218, 86),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Confirmado',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const HomeScreen(initialIndex: 10),
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Symbols.visibility,
                                    size: 20,
                                    color: Color.fromARGB(255, 22, 94, 24),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                // === EDITAR abre modal centrado ===
                                GestureDetector(
                                  onTap: () => _abrirModalEditar(context),
                                  child: const Icon(
                                    Symbols.edit,
                                    size: 20,
                                    color: Color.fromARGB(255, 12, 67, 112),
                                  ),
                                ),

                                const SizedBox(width: 10),

                                GestureDetector(
                                  onTap: () => _abrirModalEliminar(context),
                                  child: const Icon(
                                    Symbols.delete,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    width: 330,
                    height: 120,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 235, 235),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Empresas S.A.S',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'empresassas@gmail.com',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'Fecha de registro',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '21/04/25',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 81, 218, 86),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Confirmado',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const HomeScreen(initialIndex: 10),
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Symbols.visibility,
                                    size: 20,
                                    color: Color.fromARGB(255, 22, 94, 24),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                // === EDITAR abre modal centrado ===
                                GestureDetector(
                                  onTap: () => _abrirModalEditar(context),
                                  child: const Icon(
                                    Symbols.edit,
                                    size: 20,
                                    color: Color.fromARGB(255, 12, 67, 112),
                                  ),
                                ),

                                const SizedBox(width: 10),

                                GestureDetector(
                                  onTap: () => _abrirModalEliminar(context),
                                  child: const Icon(
                                    Symbols.delete,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    width: 330,
                    height: 120,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 235, 235),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Empresas S.A.S',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'empresassas@gmail.com',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'Fecha de registro',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '21/04/25',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 81, 218, 86),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Confirmado',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const HomeScreen(initialIndex: 10),
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Symbols.visibility,
                                    size: 20,
                                    color: Color.fromARGB(255, 22, 94, 24),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                // === EDITAR abre modal centrado ===
                                GestureDetector(
                                  onTap: () => _abrirModalEditar(context),
                                  child: const Icon(
                                    Symbols.edit,
                                    size: 20,
                                    color: Color.fromARGB(255, 12, 67, 112),
                                  ),
                                ),

                                const SizedBox(width: 10),

                                GestureDetector(
                                  onTap: () => _abrirModalEliminar(context),
                                  child: const Icon(
                                    Symbols.delete,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),

      // Botón flotante
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Abrir modal de crear pedido
          _abrirModalCrear(context);
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Image.asset('assets/images/agregar.png', width: 50, height: 50),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
