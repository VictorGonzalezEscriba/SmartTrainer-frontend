import 'package:flutter/material.dart';
import 'package:smart_trainer/training.dart';
import 'edicionEntreno.dart';
import 'detalleEjercicio.dart';
import 'main.dart';

class detalleEntrenamiento extends StatelessWidget {
  detalleEntrenamiento(this.training);
  Training training;

  Widget _getWeight(Exercise e, BuildContext context) {
    if (e.weight == 0) {
      if (e.name == "Plancha" || e.name == "Plancha lateral" || e.name == "Plancha estrella"){
        return ListTile(
          title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
          subtitle: const Text("Tiempo a elegir", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18)),
          trailing: Text(e.series.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
          onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training, e))),
        );
      } else{
        if (e.name == "Crunch" || e.name == "Extensión de lumbar" || e.name == "Flexiones" || e.name=="Flexiones inclinadas" || e.name == "Flexiones declinadas") {
          return ListTile(
            title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            subtitle: const Text("Sin peso", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18)),
            trailing: Text(e.series.toString() + "x" + e.repes.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training, e))),
          );
        }else{
          return ListTile(
            title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            subtitle: const Text("Peso a elegir", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18)),
            trailing: Text(e.series.toString() + "x" + e.repes.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training, e))),
          );
        }
      }
    }
    else {
      if (e.name == "Plancha" || e.name == "Plancha lateral" || e.name == "Plancha estrella"){
        return ListTile(
          title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
          subtitle: Text(e.weight.toString()+ " s", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18)),
          trailing: Text(e.series.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
          onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training, e))),
        );
      } else{
        if (e.name == "Crunch" || e.name == "Extensión de lumbar" || e.name == "Flexiones" || e.name=="Flexiones inclinadas" || e.name == "Flexiones declinadas") {
          return ListTile(
            title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            subtitle: const Text("Sin peso", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18)),
            trailing: Text(e.series.toString() + "x" + e.repes.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training, e))),
          );
        }else{
          return ListTile(
            title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            subtitle: Text(e.weight.toString() + " kg", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18)),
            trailing: Text(e.series.toString() + "x" + e.repes.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training, e))),
          );
        }
      }
    }
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
            padding: const EdgeInsetsDirectional.fromSTEB(8, 15, 8, 8),
            child: _getWeight(e, context),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
        appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) =>  const MyApp())),
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
              onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => EdicionEntreno(training: training))),
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

