import 'package:flutter/material.dart';
import 'package:smart_trainer/requests.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../training.dart';

class BuscadorEjercicios extends StatefulWidget {
  const BuscadorEjercicios({Key key}) : super(key: key);

  @override
  _BuscadorState createState() => _BuscadorState();
}

class _BuscadorState extends State<BuscadorEjercicios> {
  TextEditingController editingController = TextEditingController();
  Future<ExerciseList> futureExerciseList;
  eList items = eList();
  eList filter = eList();

  @override
  void initState() {
    super.initState();
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
              trailing: const IconButton(icon: Icon(Icons.add, size: 35, color: Colors.white)),
              onTap: () => {},
            )
        )
    );
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
