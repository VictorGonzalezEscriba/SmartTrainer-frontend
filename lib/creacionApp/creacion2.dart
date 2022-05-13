import 'package:flutter/material.dart';
import 'creacion3.dart';

class PaginaCreacion2 extends StatelessWidget {
  PaginaCreacion2(this.location);
  int location;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
        appBar: AppBar(
          backgroundColor: const Color(0xFF40916C),
          automaticallyImplyLeading: true,
          title: const Text('SmartTrainer', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 100, 16, 16),
                  child: Text(
                      '¿Qué clase de entrenamiento quieres?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: TextButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => PaginaCreacion3(location,0))),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                    child: const Text(
                        'Fuerza',
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
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => PaginaCreacion3(location, 1))),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                    child: const Text(
                        'Hipertrofia',
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:16)),
                  ),
                ),
              ]
          ),
        )
    );
  }
}
