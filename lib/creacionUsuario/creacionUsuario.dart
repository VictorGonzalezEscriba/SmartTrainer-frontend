import 'package:flutter/material.dart';
import 'creacionUsuario33.dart';

class CreacionU extends StatefulWidget {
  const CreacionU({Key key}) : super(key: key);

  @override
  _CreacionUState createState() => _CreacionUState();
}

class _CreacionUState extends State<CreacionU> {
  final myController = TextEditingController();
  String trainingName = "";
  DateTime date;

  void _checkDate(BuildContext context) {
    if (trainingName == ""){
      _showAlertDialog2(context);
    }else{
       if (date == null) {
         _showAlertDialog(context);
       } else {
         Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => CreacionU3(trainingName, date)));
       }
    }
  }

  Future<String> _showAlertDialog(BuildContext context){
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color.fromRGBO(34, 40, 47, 1),
          title: const Text('¡Atención!', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
          content: const Text('Debes seleccionar una fecha para el entrenamiento.', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK',  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
            ),
          ],
        ));
  }

  Future<String> _showAlertDialog2(BuildContext context){
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color.fromRGBO(34, 40, 47, 1),
          title: const Text('¡Atención!', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
          content: const Text('Debes introducir un nombre para el entrenamiento.', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
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
      locale: const Locale("es"),
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
  void initState() {
    super.initState();
    myController.addListener(_updateTrainingName);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _updateTrainingName(){
    trainingName = myController.text;
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
                      padding: EdgeInsetsDirectional.fromSTEB(25, 50, 25, 0),
                      child: Text("¿Cómo quieres llamar al entrenamiento?", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22), textAlign: TextAlign.center,)
                  ),
                  Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(50, 25, 50, 7),
                      child: TextField(
                          textAlign: TextAlign.center,
                          controller: myController,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:18),
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF40916C))
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF40916C)),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "Nombre del entrenamiento",
                            hintStyle: TextStyle(fontFamily: 'Poppins', color: Colors.white60, fontSize:18),
                          )
                      ),
                  ),
                  Visibility(
                      visible: !keyboardIsOpen,
                      child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25, 50, 15, 3),
                      child: Text("¿Qué dia quieres asignarle al entrenamiento?", style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22), textAlign: TextAlign.center,)
                  )),
                  Visibility(
                    visible: !keyboardIsOpen,
                    child: Padding(
                      padding:  const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 3),
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
                  ),
                 Visibility(
                   visible: !keyboardIsOpen,
                   child:  Padding(
                   padding:  const EdgeInsetsDirectional.fromSTEB(15, 50, 15, 0),
                   child: ElevatedButton(
                     onPressed: () => _checkDate(context),
                     style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                     child: const Text(
                         "Confirmar",
                         style: TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize:18)),
                   ),
                 ),)
                ]
            ),
          ),
        )
    );
  }
}
