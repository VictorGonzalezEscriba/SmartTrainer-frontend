import 'package:flutter/material.dart';
import 'creacion4.dart';

class PaginaCreacion3 extends StatelessWidget {
  PaginaCreacion3(this.location, this.type);
  int location;
  int type;
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
                      '¿Qué zona del cuerpo quieres trabajar?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: TextButton(
                    // 'FullBody'
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => PaginaCreacion4(location, type, 0))),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                    child: const Text(
                        'Todo el cuerpo',
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
                    // ParteSuperior
                    onPressed: ()  => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => PaginaCreacion4(location, type, 1))),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                    child: const Text(
                        'Parte de arriba',
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
                    // ParteInferior
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => PaginaCreacion4(location, type, 2))),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                    child: const Text(
                        'Parte de abajo',
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:16)),
                  ),
                ),
              ]
          ),
        )
    );
  }
}
