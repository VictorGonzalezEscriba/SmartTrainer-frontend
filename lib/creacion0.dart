import 'package:flutter/material.dart';
import 'creacion_1.dart';

class PaginaCreacion0 extends StatelessWidget {
  // This widget is the root of your application.
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 100, 16, 16),
                child: Text(
                '¿Quieres hacer tú mismo el entrenamiento?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                  child: const Text(
                      'Yo mismo',
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
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => PaginaCreacion1())),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                  child: const Text(
                      'Lo hacemos por ti',
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:16)),
                ),
              ),
            ]
          ),
      )
    );
  }
}
