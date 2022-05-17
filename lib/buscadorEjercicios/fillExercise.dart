import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../buscadorEjercicios/buscadorEjercicios.dart';
import '../training.dart';

class fillExercise extends StatelessWidget {
  fillExercise(this.t);
  final myController = TextEditingController();
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
                      child: Text(t.name, style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22), textAlign: TextAlign.center,)
                  ),
                  ]
            ),
          ),
        )
    );
  }
}
