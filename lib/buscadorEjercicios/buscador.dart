import 'package:flutter/material.dart';
import 'package:smart_trainer/requests.dart';
import '../trainings/edicionEntreno.dart';
import '../classes.dart';
import 'package:smart_trainer/main.dart';

class Buscador extends StatefulWidget {
  const Buscador({Key key, this.training}) : super(key: key);
  final Training training;


  @override
  _Buscador createState() => _Buscador(training);
}

class _Buscador extends State<Buscador> {
  _Buscador(this.training);
  TextEditingController editingController = TextEditingController();
  Future<ExerciseList> futureExerciseList;
  eList items = eList();
  eList filter = eList();
  eList addedExercises = eList();
  Training training;

  @override
  void initState() {
    super.initState();
    if (training.exercises.isNotEmpty){
      for (Exercise e in training.exercises){
        addedExercises.addExercise(e);
      }
    }
    futureExerciseList = getExercises().then((result) {
      // print(items.length);
      setState(() {
        for (Exercise e in result.exerciseList){
          items.addExercise(e);
        }});
      return result;
    }, onError: (e){
      return e;
    });
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  Widget _checkBodyPart(Exercise e) {
    if (e.bodyPart2 == e.bodyPart3){
      return Text(e.bodyPart2, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18));
    }
    else{
      return Text(e.bodyPart2 + ", " + e.bodyPart3, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18));
    }
  }

  void _addExercise(Exercise e){
    bool added = false;
    for (Exercise ex in addedExercises.exerciseList){
      if (e == ex) {
        added = true;
      }
    }
    if (added == false){
      addedExercises.addExercise(e);
      // print(t.nExercises);
      if (addedExercises.exerciseList.length == 10) {
        _createTraining(context);
      }
    }
  }

  void _removeExercise(Exercise e){
    for (Exercise ex in addedExercises.exerciseList){
      if (e.id == ex.id){
        addedExercises.exerciseList.remove(ex);
      }
    }
  }

  Future<String> _showAlert(BuildContext context){
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color.fromRGBO(34, 40, 47, 1),
          title: const Text('Ejercicio añadido.', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK',  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
            ),
          ],
        ));
  }

  Future<String> _showAlert2(BuildContext context){
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color.fromRGBO(34, 40, 47, 1),
          title: const Text('Ejercicio eliminado.', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK',  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
            ),
          ],
        ));
  }

  Widget _getIcon(Exercise e){
    bool added = false;
    for (Exercise ex in addedExercises.exerciseList){
      if (e.id == ex.id){
        added = true;
      }
    }

    if (added == false){
      return IconButton(icon: const Icon(Icons.add, size: 35, color: Colors.white),
        onPressed: () {
          _showAlert(context);
          _addExercise(e);
        },);
    }
    else {

      return IconButton(icon: const Icon(Icons.clear, size: 35, color: Colors.white),
        onPressed: () {
          _showAlert2(context);
          _removeExercise(e);
        },);
    }
  }

  Widget _buildRow(Exercise e, int index){
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color:const Color(0x1BFFFFFF),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 15, 8, 8),
            child: ListTile(
              title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
              subtitle: _checkBodyPart(e),
              trailing: _getIcon(e),
              onTap: () => {},
            )
        )
    );
  }

  void _createTraining(BuildContext context){
    if (addedExercises.exerciseList.isEmpty) {
      addExercises(training.id, null);
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) =>  EdicionEntreno(training: training)));
    }else{
      // llamada al backend
      addExercises(training.id, addedExercises.exerciseList);
      // volver a incio tras esperar
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => EdicionEntreno(training: training)));
    }
  }

  Future<String> _showAlertDialog(BuildContext context){
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color.fromRGBO(34, 40, 47, 1),
          title: const Text('Error:', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
          content: const Text('Debes añadir al menos 1 ejercicio.', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK',  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
            ),
          ],
        ));
  }

  void _moveToHome() async {
    await Future.delayed(const Duration(milliseconds: 500), (){});
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const MyApp()));
  }

  void searchExercise(String q){
    final query = q.toLowerCase();
    eList dummySearchList = eList();
    for (Exercise e in items.exerciseList){
      dummySearchList.addExercise(e);
    }

    if (query.isNotEmpty){
      eList dummyListData = eList();
      for (var item in dummySearchList.exerciseList) {
        bool added = false;
        if(item.name.toLowerCase().contains(query) || item.bodyPart2.toLowerCase().contains(query) || item.bodyPart3.toLowerCase().contains(query)){
          dummyListData.addExercise(item);
        }
      }
      setState(() {
        filter.exerciseList.clear();
        for (Exercise e in dummyListData.exerciseList){
          filter.addExercise(e);
        }
      });
      return;
    } else {
      setState(() {
        filter.exerciseList.clear();
        for (Exercise e in items.exerciseList){
          filter.addExercise(e);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom!=0.0;
    return FutureBuilder<ExerciseList>(
        future: futureExerciseList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                            padding: const EdgeInsetsDirectional.fromSTEB(15, 25, 15, 8),
                            child: TextField(
                              onChanged: (value) {
                                searchExercise(value);
                              },
                              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22),
                              controller: editingController,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                      borderSide: BorderSide(
                                          color: Color(0xFF40916C), width: 2.0
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                      borderSide: BorderSide(
                                          color: Color(0xFF40916C), width: 2.0
                                      )),
                                  labelText: "Búsqueda",
                                  labelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:20),
                                  hintText: "Nombre o parte del cuerpo",
                                  hintStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:20),
                                  prefixIcon: Icon(Icons.search, color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.all(16.0),
                              itemCount: filter.exerciseList.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  _buildRow(filter.exerciseList[index], index),
                              separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                            ),
                          ),
                          Visibility(
                            visible: !keyboardIsOpen,
                            child: Padding(
                              padding:  const EdgeInsetsDirectional.fromSTEB(15, 35, 15, 35),
                              child: ElevatedButton(
                                onPressed: () =>showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
                                    title: const Text('¡Atención!', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
                                    content: const Text('¿Añadir ejercicios?', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60)),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'Cancelar'),
                                        child: const Text('Cancelar', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
                                      ),
                                      TextButton(
                                        onPressed: () => {
                                          Navigator.pop(context, 'Confirmar'),
                                          _createTraining(context)
                                        },
                                        child: const Text('Confirmar',  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
                                      ),
                                    ],
                                  ),
                                ),
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                                child: const Text(
                                    "Confirmar",
                                    style: TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize:18)),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                )
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
              height: MediaQuery.of(context).size.height,
              color: const Color(0x1BFFFFFF),
              child: const Center(
                child: CircularProgressIndicator(),
              )
          );
        }
    );
  }
}
