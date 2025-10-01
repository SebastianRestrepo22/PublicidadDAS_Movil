import 'package:flutter/material.dart';
import 'package:publicidaddas_movil/presentation/pages/agenda_screen.dart';
import 'package:publicidaddas_movil/presentation/pages/bienvenida_screen.dart';
import 'package:publicidaddas_movil/presentation/pages/estadisticas_ventas_mensuales_screen.dart';
import 'package:publicidaddas_movil/presentation/pages/estadisticas_ventas_semanales_screen.dart';
import 'package:publicidaddas_movil/presentation/pages/inicio_screen.dart';
import 'package:publicidaddas_movil/presentation/pages/insumo_page.dart';
import 'package:publicidaddas_movil/presentation/pages/pedidos_screen.dart';
import 'package:publicidaddas_movil/presentation/pages/perfil_screen.dart';
import 'package:publicidaddas_movil/presentation/pages/ventas_screen.dart';
import 'package:publicidaddas_movil/presentation/pages/ver_pedido_screen.dart';
import 'package:publicidaddas_movil/presentation/pages/ver_venta_screen.dart';
import 'package:publicidaddas_movil/presentation/widgets/bottom_nav_bar.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BienvenidaPage(), // inicia con la bienvenida
    );
  }
}

class HomeScreen extends StatefulWidget {
  final int initialIndex;

  const HomeScreen({super.key, required this.initialIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _pages = [
    const perfilPage(),                       // 0
    const ventasPage(),                       // 1
    const InsumosScreen(),                    // 2
    const InsumosPage(),                      // 3
    const pedidosPage(),                      // 4
    const verPedidoPage(),                    // 5
    const verVentaPage(),                     // 6
    const AgendaScreen(),                     // 7
    const EstadisticasVentasMensualesPage(),  // 8
    const VentasPageSemanal(),                // 9
    const verPedidoPage(),                    // 10
    const verVentaPage(),                     // 11
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavBar(
        // si el índice es mayor a 4 (los 5 ítems de tu nav),
        // entonces se resetea al "Home" (2)
        currentIndex: _currentIndex < 5 ? _currentIndex : 2,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
