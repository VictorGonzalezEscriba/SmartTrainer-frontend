import 'package:flutter/material.dart';
import '../main.dart';
import 'creacion_1.dart';
import 'package:smart_trainer/requests.dart';
import '../creacionUsuario/creacionUsuario.dart';
import 'package:firebase_database/firebase_database.dart';

class PaginaCreacion0 extends StatefulWidget {
  const PaginaCreacion0({Key key}) : super(key: key);

  @override
  _PaginaCreacion0 createState() => _PaginaCreacion0();
}


class _PaginaCreacion0 extends State<PaginaCreacion0> {
  // This widget is the root of your application.
  final _textFieldController = TextEditingController();
  String codeDialog;
  String valueText = "";

  void _importarEntreno(String id){
      // print(id);
      DatabaseReference ref = FirebaseDatabase.instance.ref("trainings/$id");
      ref.onValue.listen((event) {
        final data = event.snapshot.value;
        if (data != null){
          // print(data);
          importTraining(data);
          _showSuccessDialog(context);
        }
        else{
          _showFailDialog(context);
        }
      });
  }

  Future<void> _showSuccessDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
            title: const Text('Operación completada.', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
            actions: <Widget>[
              TextButton(
                onPressed: () => {
                  Navigator.pop(context, 'Confirmar'),
                  _textFieldController.clear(),
                  Navigator.of(context).popUntil((route) => route.isFirst),
                },
                child: const Text('Confirmar',  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
              ),
            ],
          );
        });
  }

 Future<String> _showFailDialog(BuildContext context) async {
    return showDialog<String>(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
            title: const Text('No se ha podido realizar la operación.', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
            actions: <Widget>[
              TextButton(
                onPressed: () => {
                  Navigator.pop(context, 'Confirmar'),
                  _textFieldController.clear(),
                },
                child: const Text('Confirmar',  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
              ),
            ],
          );
        });
  }



  Future<String> _showDialog(BuildContext context) async {
    return showDialog<String>(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
            title: const Text('Introduce el código del entrenamiento: ', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white)),
            content: TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              style: const TextStyle(color: Colors.white60),
              decoration: const InputDecoration(
                  hintText: "Código de entrenamiento",
                  hintStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white60)),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => {
                  Navigator.pop(context, 'Cancelar'),
                  _textFieldController.clear(),

                },
                child: const Text('Cancelar',  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
              ),
              TextButton(
                onPressed: () => {
                  if (valueText != ""){
                    _importarEntreno(valueText),
                    Navigator.pop(context, 'Confirmar'),
                  }
                  else{
                    Navigator.pop(context, 'Confirmar'),
                  }
                },
                child: const Text('Confirmar',  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Color(0xFF40916C))),
              ),
            ],
          );
        });
  }

  Future<bool> _onWillPop() async {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom!=0.0;
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
        backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: const Color(0xFF40916C),
          title: const Text('SmartTrainer', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
          centerTitle: true,
          elevation: 2,

        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 100, 16, 16),
                child: Text(
                '¿Cómo quieres hacer el entrenamiento?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: TextButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const CreacionU())),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                  child: const Text(
                      'Yo mismo',
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:16)),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Text("- O -", style:TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:16))
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: TextButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => PaginaCreacion1())),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                  child: const Text(
                      'Lo hacemos por ti',
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:16)),
                ),
              ),
              Visibility(
                visible: !keyboardIsOpen,
                child: const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Text("- O -", style:TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:16))
                ),
              ),
              Visibility(
                visible: !keyboardIsOpen,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: TextButton(
                    onPressed: () => _showDialog(context),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xFF40916C))),
                    child: const Text(
                        'Importar entrenamiento',
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:16)),
                  ),
                ),
              ),
            ]
          ),
      )
        ));
  }
}
