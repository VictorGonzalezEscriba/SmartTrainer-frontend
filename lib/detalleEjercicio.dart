import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_trainer/training.dart';
import 'edicionEjercicio.dart';
import 'package:url_launcher/url_launcher.dart';

class detalleEjercicio extends StatelessWidget {
  detalleEjercicio(this.training, this.exercise);
  Exercise exercise;
  Training training;

  _launchUrl(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) throw 'Could not launch';
  }

  Widget _getBodyParts(Exercise e) {
    if (e.bodyPart2 != e.bodyPart3) {
      return Text(
          exercise.bodyPart2 + " , " + exercise.bodyPart3,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:16)
      );
    }
    else {
      return Text(
          exercise.bodyPart2,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:16)
      );
    }
  }

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
              onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => EdicionEjercicio(training, exercise))),
            )
          ]
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 50, 12, 8),
                child: Text(
                    exercise.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 1.0,
                  width: 275,
                  color: Colors.white60,
                ),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(120, 10, 120, 8),
                  child: _getBodyParts(exercise)
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 50, 10, 8),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 8),
                          child: Text(
                              "Peso:\n" + exercise.weight.toString() + " kg",
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 8),
                          child: Text(
                              "Series:\n" + exercise.series.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 8),
                          child: Text(
                              "Repeticiones:\n" + exercise.repes.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 50, 10, 5),
                child: ElevatedButton(
                  onPressed: () => _launchUrl(exercise.link),
                  child: const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 10,5, 10),
                    child: Text(
                        'Video de ejemplo',
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
                  ),
                  style: ElevatedButton.styleFrom(primary: const Color(0xFF40916C)),
                )),
            ],
          ),
        ),
      ),
    );
  }
}
