import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:publicidaddas_movil/main.dart';

class EstadisticasVentasMensualesPage extends StatelessWidget {
  const EstadisticasVentasMensualesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// ---------- HEADER ----------
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xFF243652), // Azul oscuro igual al otro
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Botón de regreso
                Container(
                  margin: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(initialIndex: 2),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),

                /// Título centrado
                const Text(
                  'ESTADÍSTICAS MENSUALES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// Espaciador para centrar el texto correctamente
                const SizedBox(width: 48),
              ],
            ),
          ),
        ),
      ),

      /// ---------- CONTENIDO PRINCIPAL ----------
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Estadísticas de ventas mensuales",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  barGroups: [
                    _barChartGroup(0, 250),
                    _barChartGroup(1, 280),
                    _barChartGroup(2, 350),
                    _barChartGroup(3, 100),
                    _barChartGroup(4, 290),
                  ],
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const meses = ["Enero", "Feb", "Mar", "Abr", "May"];
                          return Text(
                            meses[value.toInt()],
                            style: GoogleFonts.poppins(fontSize: 12),
                          );
                        },
                      ),
                    ),
                    rightTitles:
                        const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text("Ingresos neto", style: GoogleFonts.poppins(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 20),

            _ventaCard(
              icon: Icons.checkroom,
              titulo: "Estampación de camisa",
              monto: "\$0",
              porcentaje: "-2.1%",
              porcentajeColor: Colors.red,
              background: Colors.red.shade50,
            ),
            _ventaCard(
              icon: Icons.coffee,
              titulo: "Pocillo personalizado",
              monto: "\$291.154",
              porcentaje: "+3.1%",
              porcentajeColor: Colors.green,
              background: Colors.green.shade50,
            ),
            _ventaCard(
              icon: Icons.cut,
              titulo: "Recorte laser",
              monto: "\$300.050",
              porcentaje: "+2.1%",
              porcentajeColor: Colors.green,
              background: Colors.green.shade50,
            ),
          ],
        ),
      ),
    );
  }

  /// BARRAS DEL GRÁFICO
  BarChartGroupData _barChartGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.blue.shade800,
          width: 20,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  /// CARDS
  Widget _ventaCard({
    required IconData icon,
    required String titulo,
    required String monto,
    required String porcentaje,
    required Color porcentajeColor,
    required Color background,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: Colors.black87),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  monto,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Text(
            porcentaje,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: porcentajeColor,
            ),
          ),
        ],
      ),
    );
  }
}
