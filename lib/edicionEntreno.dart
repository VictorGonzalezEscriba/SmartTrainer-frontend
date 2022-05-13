import 'package:flutter/material.dart';
import 'package:smart_trainer/detalleEntrenamiento.dart';
import 'package:smart_trainer/training.dart';


class EdicionEntreno extends StatelessWidget {
  EdicionEntreno(this.training);
  final Training training;
  eList list;


  Widget _getWeight(Exercise e, BuildContext context) {
    return ListTile(
      title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
      trailing: IconButton(
          icon:  const Icon(Icons.close_rounded,
          color: Colors.white),
          onPressed: ()=> {
            list.addExercise(e),
          },
        ),
    );
  }

  Widget _buildRow(Exercise e, int index, BuildContext context){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color:const Color(0x1BFFFFFF),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 22, 8, 8),
        child: _getWeight(e, context),
      ),
    );
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
                Icons.close_rounded,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEntrenamiento(training))),
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
                    training.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(100, 0, 100, 8),
                child: Text(
                    training.date,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60, fontSize:16)),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: training.nExercises,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildRow(training.exercises[index], index, context),
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

