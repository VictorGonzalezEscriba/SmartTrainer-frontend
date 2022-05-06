import 'package:flutter/material.dart';
import 'package:smart_trainer/training.dart';
import 'creacion_1.dart';
import 'edicionEntreno.dart';

class detalleEjercicio extends StatelessWidget {
  detalleEjercicio(this.training, this.exercise);
  Exercise exercise;
  Training training;


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
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.create_rounded,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => EdicionEntreno(training))),
            )
          ]
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(120, 50, 120, 8),
              child: Text(
                  exercise.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
            ),
          ],
        ),
      ),
    );
  }
}
