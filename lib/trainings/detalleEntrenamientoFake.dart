import 'package:flutter/material.dart';
import 'package:smart_trainer/classes.dart';
import '../calendar.dart';
import 'edicionEntreno.dart';
import '../exercises/detalleEjercicio.dart';
import '../main.dart';
import '../buscadorEjercicios/buscador.dart';

class detalleEntrenamiento2 extends StatefulWidget {
  const detalleEntrenamiento2({Key key, this.training}) : super(key:key);
  final Training training;

  @override
  _detalleEntrenamiento2 createState() => _detalleEntrenamiento2(training);
}

class _detalleEntrenamiento2 extends State<detalleEntrenamiento2>  {
  _detalleEntrenamiento2(this.training);
  Training training;

  Widget _getWeight(Exercise e, BuildContext context) {
    if (e.weight == 0) {
      if (e.name == "Plancha" || e.name == "Plancha lateral" || e.name == "Plancha estrella"){
        return ListTile(
          title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
          subtitle: const Text("Tiempo a elegir", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18)),
          trailing: Text(e.series.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
          onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training: training, exercise: e))),
        );
      } else{
        if ( e.name == "Flexión de hombro" || e.name == "Crunch" || e.name == "Extensión de lumbar" || e.name == "Flexiones" || e.name=="Flexiones inclinadas" || e.name == "Flexiones declinadas") {
          return ListTile(
            title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            subtitle: const Text("Sin peso", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18)),
            trailing: Text(e.series.toString() + "x" + e.repes.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training: training, exercise: e))),
          );
        }else{
          return ListTile(
            title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            subtitle: const Text("Peso a elegir", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18)),
            trailing: Text(e.series.toString() + "x" + e.repes.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training: training, exercise: e))),
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
          onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training: training, exercise: e))),
        );
      } else{
        if (e.name == "Crunch" || e.name == "Extensión de lumbar" || e.name == "Flexiones" || e.name=="Flexiones inclinadas" || e.name == "Flexiones declinadas") {
          return ListTile(
            title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            subtitle: const Text("Sin peso", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18)),
            trailing: Text(e.series.toString() + "x" + e.repes.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training: training, exercise: e))),
          );
        }else{
          return ListTile(
            title: Text(e.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            subtitle: Text(e.weight.toString() + " kg", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 18)),
            trailing: Text(e.series.toString() + "x" + e.repes.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEjercicio(training: training, exercise: e))),
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

  Widget _checkList(BuildContext context){
    return training.exercises.isEmpty ?  Center(child:ElevatedButton(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => Buscador(training: training))),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
      child: const Text(
          "Añadir ejercicios",
          style: TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize:18)),
    ),)
        : ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: training.exercises.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildRow(training.exercises[index], index, context),
        separatorBuilder: (BuildContext context, int index) =>
        const Divider());
  }

  Future<bool> _onWillPop() async {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
      appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
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
                child: _checkList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
