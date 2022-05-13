import 'package:flutter/material.dart';
import 'package:smart_trainer/training.dart';


class EdicionEjercicio extends StatelessWidget {
  EdicionEjercicio(this.training, this.exercise);
  Training training;
  Exercise exercise;
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
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.create_rounded,
                  color: Color.fromRGBO(34, 40, 47, 1),
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => EdicionEjercicio(training, exercise))),
              )
            ]
        ),
        body: SafeArea(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(100, 50, 100, 16),
                  child: Text(
                      training.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
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
                    onPressed: () => {},
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
