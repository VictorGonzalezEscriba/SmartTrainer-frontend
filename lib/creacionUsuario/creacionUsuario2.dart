import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../training.dart';
import 'creacionUsuario33.dart';

class CreacionU2 extends StatefulWidget {
  const CreacionU2({Key key, this.trainingName}) : super(key: key);
  final String trainingName;

  @override
  _CreacionU2 createState() => _CreacionU2(trainingName);
}

class _CreacionU2 extends State<CreacionU2> {
  _CreacionU2(this.trainingName);
  final myController = TextEditingController();
  String trainingName;
  DateTime date;

  void _checkDate(BuildContext context) {
    if (date != null){
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => CreacionU3(trainingName, date)));
    }else{
      _showAlertDialog(context);
    }
  }

  Future<String> _showAlertDialog(BuildContext context){
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Color.fromRGBO(34, 40, 47, 1),
        title: const Text('¡Atención!', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
        content: const Text('Debes seleccionar una fecha para el entrenamiento', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK',  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
          ),
        ],
      ));
  }

  void _selectDate(BuildContext context) async{
    date  = await showDatePicker(
      context: context,
      locale: const Locale("es", "ES"),
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF40916C),
              onPrimary: Colors.white,
              onSurface: Color.fromRGBO(34, 40, 47, 1),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: const Color(0xFF40916C),
              ),
            ),
          ),
          child: child,
        );
      },
    );
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
                children: [
                  const Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(25, 75, 25, 50),
                      child: Text("¿Qué dia quieres asignarle al entrenamiento?", style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22), textAlign: TextAlign.center,)
                  ),
                  Padding(
                    padding:  const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                    child: CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xFF40916C),
                        child: IconButton(
                          onPressed: () => _selectDate(context),
                          icon: const Icon(
                            Icons.calendar_month_rounded,
                            color:  Color.fromRGBO(34, 40, 47, 1),
                            size: 30,
                          ),
                        )
                    ),
                  ),
                  Visibility(
                    visible: !keyboardIsOpen,
                    child: Padding(
                      padding:  const EdgeInsetsDirectional.fromSTEB(15, 100, 15, 0),
                      child: ElevatedButton(
                        onPressed: () => _checkDate(context),
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
  }
}
