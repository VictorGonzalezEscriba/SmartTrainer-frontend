import 'package:flutter/material.dart';
import 'package:smart_trainer/training.dart';
import 'detalleEjercicio.dart';
import 'detalleEntrenamiento.dart';
import 'main.dart';
import 'requests.dart';


class EdicionEjercicio extends StatefulWidget {
  const EdicionEjercicio({Key key, this.training, this.exercise}) : super(key: key);
  final Training training;
  final Exercise exercise;

  @override
  _EdicionEjercicio createState() => _EdicionEjercicio(training, exercise);
}

class _EdicionEjercicio extends State<EdicionEjercicio> {
  _EdicionEjercicio(this.training, this.exercise);
  TextEditingController weightController = TextEditingController();
  TextEditingController seriesController = TextEditingController();
  TextEditingController repesController = TextEditingController();

  Exercise exercise;
  Training training;

  double newWeight = 0.0;
  int newSeries = 0;
  int newRepes = 0;

  void _editE(BuildContext context){
    bool changed = false;
    if (exercise.weight != newWeight && newWeight != 0){
      exercise.weight = newWeight;
      changed = true;
    }

    if (exercise.series != newSeries && newSeries != 0){
      exercise.series = newSeries;
      changed = true;
    }

    if (exercise.repes != newRepes && newRepes != 0) {
      exercise.repes = newRepes;
      changed = true;
    }

    if (changed == true){
      newWeight = 0.0;
      newSeries = 0;
      newRepes = 0;
      editExercise(training.id, exercise);
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training, exercise)));
    }
  }

  Widget _getRow2() {
    if (exercise.name == "Crunch" || exercise.name == "Extensión de lumbar" || exercise.name == "Flexiones" || exercise.name=="Flexiones inclinadas" || exercise.name == "Flexiones declinadas") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 8),
              child: TextField(
                onChanged: (value) {
                  changeSeries(int.parse(value));
                },
                style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22),
                controller: seriesController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    label: Center(child: Text(exercise.series.toString())),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(
                            color: Color(0xFF40916C), width: 2.0
                        )
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(
                            color: Color(0xFF40916C), width: 2.0
                        )),
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:20),
                    hintText: exercise.series.toString(),
                    hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:20),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 8),
              child: TextField(
                onChanged: (value) {
                  changeRepes(int.parse(value));
                },
                style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22),
                controller: repesController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    label: Center(child: Text(exercise.repes.toString())),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(
                            color: Color(0xFF40916C), width: 2.0
                        )
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(
                            color: Color(0xFF40916C), width: 2.0
                        )),
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:20),
                    hintText: exercise.repes.toString(),
                    hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:20),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
          ),
        ],
      );
    }
    else{
      if (exercise.name == "Plancha" || exercise.name == "Plancha lateral" || exercise.name == "Plancha estrella"){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 8),
                child: TextField(
                  onChanged: (value) {
                    changeWeight(double.parse(value));
                  },
                  style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22),
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      label: Center(child: Text(exercise.weight.toString())),
                      alignLabelWithHint: true,
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                              color: Color(0xFF40916C), width: 2.0
                          )
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                              color: Color(0xFF40916C), width: 2.0
                          )),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:20),
                      hintText: exercise.weight.toString(),
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:20),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 8),
                child: TextField(
                  onChanged: (value) {
                    changeSeries(int.parse(value));
                  },
                  style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22),
                  controller: seriesController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      label: Center(child: Text(exercise.series.toString())),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                              color: Color(0xFF40916C), width: 2.0
                          )
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                              color: Color(0xFF40916C), width: 2.0
                          )),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:20),
                      hintText: exercise.series.toString(),
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:20),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
            ),

          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 8),
                child: TextField(
                  onChanged: (value) {
                    changeWeight(double.parse(value));
                  },
                  style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22),
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      label: Center(child: Text(exercise.weight.toString())),
                      alignLabelWithHint: true,
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                              color: Color(0xFF40916C), width: 2.0
                          )
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                              color: Color(0xFF40916C), width: 2.0
                          )),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:20),
                      hintText: exercise.weight.toString(),
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:20),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 8),
                child: TextField(
                  onChanged: (value) {
                    changeSeries(int.parse(value));
                  },
                  style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22),
                  controller: seriesController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      label: Center(child: Text(exercise.series.toString())),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                              color: Color(0xFF40916C), width: 2.0
                          )
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                              color: Color(0xFF40916C), width: 2.0
                          )),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:20),
                      hintText: exercise.series.toString(),
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:20),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 8),
                child: TextField(
                  onChanged: (value) {
                    changeRepes(int.parse(value));
                  },
                  style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22),
                  controller: repesController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      label: Center(child: Text(exercise.repes.toString())),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                              color: Color(0xFF40916C), width: 2.0
                          )
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                              color: Color(0xFF40916C), width: 2.0
                          )),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:20),
                      hintText: exercise.repes.toString(),
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:20),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
            ),
          ],
        );
      }
    }
  }

  Widget _getRow() {
    if (exercise.name == "Plancha" || exercise.name == "Plancha lateral" || exercise.name == "Plancha estrella"){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
        children: const [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 8),
            child: Text(
                "Tiempo:  ",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 8),
            child: Text(
                "Series: ",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)
            ),
          ),
        ],
      );
    } else {
      if (exercise.name == "Crunch" || exercise.name == "Extensión de lumbar" || exercise.name == "Flexiones" || exercise.name=="Flexiones inclinadas" || exercise.name == "Flexiones declinadas") {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
          children: const [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 8),
              child: Text(
                  "Series:  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 8),
              child: Text(
                  "Repeticiones:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)
              ),
            ),
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
          children: const [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 8),
              child: Text(
                  "Peso:  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 8),
              child: Text(
                  "Series:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 8),
              child: Text(
                  "Repeticiones:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)
              ),
            ),
          ],
        );
      }
    }
  }

  void changeWeight(double value){
    newWeight = value;
  }

  void changeSeries(int value) {
    newSeries = value;
  }

  void changeRepes(int value) {
    newRepes = value;
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

  void _eliminaEjercicio(int trainingId, int exerciseId) async {
    eliminaEjercicio(trainingId, exerciseId);
    await Future.delayed(const Duration(milliseconds: 500), (){});
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) =>  const MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom!=0.0;
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
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 30, 12, 0),
                child: Text(
                    'EDICIÓN',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:18)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 30, 12, 8),
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
                padding: const EdgeInsetsDirectional.fromSTEB(10, 30, 10, 8),
                child: _getRow(),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 2, 10, 8),
                child: _getRow2(),
              ),
              Padding(
                padding:  const EdgeInsetsDirectional.fromSTEB(35, 50, 35, 0),
                child: Center(
                  child: Visibility(
                    visible: !keyboardIsOpen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 15, 0),
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color(0xFF40916C),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.save,
                                  color: const Color.fromRGBO(34, 40, 47, 1),
                                  size: 30,
                                ),
                                onPressed: () => _editE(context),
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color.fromRGBO(197, 38, 27, 1),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color:  Color.fromRGBO(34, 40, 47, 1),
                                  size: 30,
                                ),
                                onPressed: () =>  Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training, exercise))),
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(15, 16, 0, 0),
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color.fromRGBO(197, 38, 27, 1),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color:  Color.fromRGBO(34, 40, 47, 1),
                                  size: 30,
                                ),
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
                                    title: const Text('¡Atención!', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
                                    content: Text('¿Seguro que quieres eliminar el ejercicio?',  style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60)),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
                                      ),
                                      TextButton(
                                        onPressed: () => {
                                          Navigator.pop(context, 'OK'),
                                          _eliminaEjercicio(training.id, exercise.id)
                                        },
                                        child: const Text('OK',  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
