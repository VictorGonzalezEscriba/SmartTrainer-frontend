import 'package:flutter/material.dart';
import 'package:smart_trainer/main.dart';
import 'package:smart_trainer/requests.dart';

class PaginaCreacion4 extends StatelessWidget {
  PaginaCreacion4(this.location, this.type, this.part);
  int location;
  int type;
  int part;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
        appBar: AppBar(
          backgroundColor: const Color(0xFF40916C),
          leading: IconButton(icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('SmartTrainer', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(65, 0, 50, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 100, 16, 16),
                  child: Text(
                      '¿Crear entrenamiento?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: TextButton(
                    onPressed: () async {
                      generateTraining(location, type, part);
                      await Future.delayed(const Duration(milliseconds: 500), (){});
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                    child: const Text(
                        'Si',
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:16)),
                  ),
                ),
                const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Text("- O -", style:TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:16))
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: TextButton(
                    // 'FullBody'
                    onPressed: () => {
                      Navigator.of(context).popUntil((route) => route.isFirst)
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(197, 38, 27, 1))),
                    child: const Text(
                        'No',
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:16)),
                  ),
                ),
              ]
          ),
          )

        )
    );
  }
}
