import 'package:flutter/material.dart';
import 'package:smart_trainer/trainings/detalleEntrenamiento.dart';
import 'package:smart_trainer/classes.dart';
import 'edicionEjercicio.dart';
import 'package:url_launcher/url_launcher.dart';



class detalleEjercicio extends StatefulWidget {
  const detalleEjercicio({Key key, this.training, this.exercise}) : super(key:key);
  final Training training;
  final Exercise exercise;

  @override
  _detalleEjercicio createState() => _detalleEjercicio(training, exercise);
}

class _detalleEjercicio extends State<detalleEjercicio> {
  _detalleEjercicio(this.training, this.exercise);
  Exercise exercise;
  Training training;

  _launchUrl(String uri) async {
    if (!await launchUrl(Uri.parse(exercise.link))) throw 'Could not launch';
  }

  Widget _getRow() {
    if (exercise.name == "Plancha" || exercise.name == "Plancha lateral" || exercise.name == "Plancha estrella"){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 8),
            child: Text(
                "Tiempo:\n" + exercise.weight.toString() + " s",
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
        ],
      );
    } else {
      if (exercise.name == "Crunch" || exercise.name == "Extensión de lumbar" || exercise.name == "Flexiones" || exercise.name=="Flexiones inclinadas" || exercise.name == "Flexiones declinadas") {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
          children: [
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
        );
      } else {
        return Row(
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
        );
      }
    }
  }

  Widget _getBodyParts() {
    if (exercise.bodyPart2 != exercise.bodyPart3) {
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

  Future<bool> _onWillPop() async {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEntrenamiento(training: training), settings: const RouteSettings(name: 'detalleEntreno')));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
      backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
      appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEntrenamiento(training: training), settings: const RouteSettings(name: 'detalleEntreno'))),
          ),
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
              onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => EdicionEjercicio(training: training, exercise: exercise))),
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 1.0,
                  width: 275,
                  color: Colors.white60,
                ),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(120, 10, 120, 8),
                  child: _getBodyParts()
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 50, 10, 8),
                  child: Center(
                    child: _getRow(),
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
    ));
  }
}
