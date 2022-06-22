import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../buscadorEjercicios/buscadorEjercicios.dart';
import '../classes.dart';

class CreacionU3 extends StatelessWidget {
  CreacionU3(this.trainingName, this.date);
  final myController = TextEditingController();
  String trainingName;
  DateTime date;
  newTraining t;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: const Color(0xFF40916C),
          title: const Text('SmartTrainer', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
          centerTitle: true,
          elevation: 2,

        ),
        body: SafeArea(
          child: Center(
            child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(12, 50, 12, 8),
                      child: Text(trainingName, style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22), textAlign: TextAlign.center,)
                  ),
                  Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(100, 0, 100, 8),
                      child: Text(date.day.toString() + "-" + date.month.toString() + "-" + date.year.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:18), textAlign: TextAlign.center,)
                  ),
                  const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                      child: Text("¡Empieza a añadir ejercicios!",
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:25), textAlign: TextAlign.center,)
                  ),
                  Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xFF40916C),
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color:  Color.fromRGBO(34, 40, 47, 1),
                          size: 30,
                        ),
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => BuscadorEjercicios(trainingName: trainingName, date: date))),
                      )
                  ),
                  ),]
            ),
          ),
        )
    );
  }
}
