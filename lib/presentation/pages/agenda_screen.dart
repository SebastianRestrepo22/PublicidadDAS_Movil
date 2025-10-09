import 'package:flutter/material.dart';
import 'package:publicidaddas_movil/presentation/widgets/agenda_appbar.dart';
import 'package:publicidaddas_movil/presentation/widgets/event_card.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final List<Map<String, dynamic>> eventos = [];

  void _openModal({Map<String, dynamic>? evento, int? index, DateTime? fecha}) {
    final nombreController = TextEditingController(
      text: evento?["nombre"] ?? "",
    );
    final servicioController = TextEditingController(
      text: evento?["servicio"] ?? "",
    );
    final horaController = TextEditingController(
      text: evento?["hora"] ?? "",
    );

    DateTime fechaSeleccionada = evento?["fecha"] ?? fecha ?? DateTime.now();
    final fechaController = TextEditingController(
      text: DateFormat("dd/MM/yyyy").format(fechaSeleccionada),
    );

    const inputDecoration = InputDecoration(
      border: UnderlineInputBorder(),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      labelStyle: TextStyle(color: Colors.black),
    );

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(index == null ? "Nueva cita" : "Editar cita"),
          content: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nombreController,
                  decoration: inputDecoration.copyWith(labelText: "Nombre"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: servicioController,
                  decoration: inputDecoration.copyWith(labelText: "Servicio"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: fechaController,
                  decoration: inputDecoration.copyWith(labelText: "Fecha"),
                 
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: horaController,
                  decoration: inputDecoration.copyWith(labelText: "Hora"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar", style: TextStyle(color: Colors.indigo)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 99, 109, 165),
              ),
              onPressed: () {
                setState(() {
                  if (index == null) {
                    eventos.add({
                      "nombre": nombreController.text,
                      "servicio": servicioController.text,
                      "fecha": fechaSeleccionada,
                      "hora": horaController.text,
                    });
                  } else {
                    eventos[index] = {
                      "nombre": nombreController.text,
                      "servicio": servicioController.text,
                      "fecha": fechaSeleccionada,
                      "hora": horaController.text,
                    };
                  }
                });
                Navigator.pop(context);
              },
              child: const Text("Guardar", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  List<Map<String, dynamic>> get _eventosDelDia {
    if (_selectedDay == null) return [];
    return eventos.where((evento) {
      final fechaEvento = evento["fecha"] as DateTime;
      return fechaEvento.year == _selectedDay!.year &&
          fechaEvento.month == _selectedDay!.month &&
          fechaEvento.day == _selectedDay!.day;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AgendaAppBar(),
      ),
      body: Column(
        children: [
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
              _openModal(fecha: selectedDay);
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
              rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
            ),
          ),
          Expanded(
            child: _eventosDelDia.isEmpty
                ? const Center(
                    child: Text(
                      "No hay eventos en esta fecha",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _eventosDelDia.length,
                    itemBuilder: (context, index) {
                      final evento = _eventosDelDia[index];
                      return EventCard(
                        evento: {
                          "nombre": evento["nombre"],
                          "servicio": evento["servicio"],
                          "fecha": DateFormat("dd/MM/yyyy").format(evento["fecha"]),
                          "hora": evento["hora"] ?? "",
                        },
                        onEdit: () {
                          final realIndex = eventos.indexOf(evento);
                          _openModal(evento: evento, index: realIndex);
                        },
                        onDelete: () {
                          setState(() {
                            eventos.remove(evento);
                          });
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}