import 'package:flutter/material.dart';
import 'package:publicidaddas_movil/presentation/widgets/agenda_appbar.dart';
import 'package:publicidaddas_movil/presentation/widgets/event_card.dart';
import 'package:table_calendar/table_calendar.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final List<Map<String, String>> eventos = [
    {
      "nombre": "Maria Elena",
      "servicio": "Instalacion de valla",
      "fecha": "17/09/2025",
    },
    {
      "nombre": "Pedro Lopez",
      "servicio": "Mantenimiento general",
      "fecha": "20/09/2025",
    },
    {
      "nombre": "Ana Torres",
      "servicio": "Revisión de equipos",
      "fecha": "25/09/2025",
    },
  ];

  void _openModal({Map<String, String>? evento, int? index}) {
    final nombreController = TextEditingController(
      text: evento?["nombre"] ?? "",
    );
    final servicioController = TextEditingController(
      text: evento?["servicio"] ?? "",
    );
    final fechaController = TextEditingController(text: evento?["fecha"] ?? "");
    final horaController = TextEditingController(text: evento?["hora"] ?? "");

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text("Agenda"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nombreController,
                  decoration: const InputDecoration(labelText: "Nombre"),
                ),
                TextField(
                  controller: servicioController,
                  decoration: const InputDecoration(labelText: "Servicio"),
                ),
                TextField(
                  controller: fechaController,
                  decoration: const InputDecoration(labelText: "Fecha"),
                ),
                TextField(
                  controller: horaController,
                  decoration: const InputDecoration(labelText: "Hora"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cerrar",
                style: TextStyle(color: Colors.indigo),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 99, 109, 165)),
              onPressed: () {
                setState(() {
                  if (index == null) {
                    eventos.add({
                      "nombre": nombreController.text,
                      "servicio": servicioController.text,
                      "fecha": fechaController.text,
                      "hora": horaController.text,
                    });
                  } else {
                    eventos[index] = {
                      "nombre": nombreController.text,
                      "servicio": servicioController.text,
                      "fecha": fechaController.text,
                      "hora": horaController.text,
                    };
                  }
                });
                Navigator.pop(context);
              },
              child: const Text("Guardar", style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar custom (lo importamos como widget)
      backgroundColor: Colors.white,

      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AgendaAppBar(),
      ),

      body: Column(
        children: [
          // CALENDARIO
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
              rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
            ),
          ),

          // LISTA DE EVENTOS
          Expanded(
            child: ListView.builder(
              itemCount: eventos.length,
              itemBuilder: (context, index) {
                final evento = eventos[index];
                return EventCard(
                  evento: evento,
                  onEdit: () => _openModal(evento: evento, index: index),
                  onDelete: () {
                    setState(() {
                      eventos.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 122, 127, 184),
        onPressed: () => _openModal(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
