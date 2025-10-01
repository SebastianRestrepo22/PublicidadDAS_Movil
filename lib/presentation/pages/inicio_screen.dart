import 'package:flutter/material.dart';
import 'package:publicidaddas_movil/main.dart';
import '../widgets/big_card.dart';
import '../widgets/small_card.dart';


class InsumosScreen extends StatefulWidget {
  const InsumosScreen({super.key});

  @override
  State<InsumosScreen> createState() => _InsumosScreenState();
}

class _InsumosScreenState extends State<InsumosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 229, 229),
      body: Column(
        children: [
          // ---------- NAVBAR SUPERIOR ----------
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF1B365D),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Text(
                    "HOME",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ---------- CONTENIDO PRINCIPAL ----------
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    // Cards grandes
                    Row(
                      children: [
                        Expanded(
                          child: BigCard(
                            color: Colors.green,
                            icon: Icons.local_shipping,
                            number: '12',
                            text: 'Entregas hoy',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(initialIndex: 7),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: BigCard(
                            color: Colors.blue,
                            icon: Icons.access_time,
                            number: '8',
                            text: 'Pedidos pendientes',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(initialIndex: 7),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Cards pequeñas
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                      children: [
                       SmallCard(
                          icon: Icons.event,
                          iconColor: Colors.grey,
                          text: 'Agenda',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(initialIndex: 7),
                              ),
                            );
                          },
                        ),
                        SmallCard(
                          icon: Icons.inventory_2,
                          iconColor: Colors.green,
                          text: 'Insumos',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const  HomeScreen(initialIndex: 3),
                              ),
                            );
                          },
                        ),
                        SmallCard(
                          icon: Icons.shopping_cart,
                          iconColor: Colors.deepOrange,
                          text: 'Ventas',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(initialIndex: 1),
                              ),
                            );
                          },
                        ),
                        SmallCard(
                          icon: Icons.assignment,
                          iconColor: Colors.brown,
                          text: 'Pedidos',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(initialIndex: 4),
                              ),
                            );
                          },
                        ),
                        SmallCard(
                          icon: Icons.date_range,
                          iconColor: Colors.black,
                          text: 'Semanales',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(initialIndex: 9),
                              ),
                            );
                          },
                        ),
                        SmallCard(
                          icon: Icons.insert_chart,
                          iconColor: Colors.yellowAccent,
                          text: 'Mensuales',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(initialIndex: 8),
                              ),
                            );
                          },
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}