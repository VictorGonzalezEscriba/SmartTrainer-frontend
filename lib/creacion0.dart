import 'package:flutter/material.dart';

class Creacion0Widget extends StatefulWidget {
  const Creacion0Widget({Key key}) : super(key: key);

  @override
  _Creacion0WidgetState createState() => _Creacion0WidgetState();
}

class _Creacion0WidgetState extends State<Creacion0Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF40916C),
        automaticallyImplyLeading: true,
        title: Text('SmartTrainer', style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
        centerTitle: true,
        elevation: 2,
        ),
      body: Column(
        children: const [
          Text("¿Quieres hacer tú mismo el entranamiento?")
        ],
      )
      );
  }
}
