import 'package:flutter/material.dart';
import 'package:smart_trainer/requests.dart';
import 'package:smart_trainer/training.dart';
import 'calendar.dart';
import 'creacionApp/creacion0.dart';
import 'detalleEntrenamiento.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates:
        GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('es'),
      ],
      title: 'SmartTrainer',
      theme: ThemeData(
        // This is the theme of your application.
        backgroundColor: const Color(0x11111111),
        primaryColor: const Color(0xFF40916C),
      ),
      home: const MyHomePage(title: 'SmartTrainer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super();
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<TrainingList> futureTrainingList;
  int _selectedIndex = 0;
  tList trainingsList = tList();

  @override
  void initState(){
    super.initState();
    futureTrainingList = getTrainings();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      if (_selectedIndex == 1) {
        Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => Calendario()));
      }
    });
  }

  Widget _buildRow(Training t, int index){
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
              title: Text(t.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
              subtitle: Text(t.date, style: const TextStyle(color: Colors.white60)),
              trailing: const Icon(Icons.chevron_right_outlined, size: 35, color: Colors.white),
              onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEntrenamiento(t))),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TrainingList>(
        future: futureTrainingList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
              appBar: AppBar(
                backgroundColor: const Color(0xFF40916C),
                automaticallyImplyLeading: false,
                title: const Text("Smart Trainer", style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
                centerTitle: true,
                elevation: 2,
                // actions: <Widget>[
                //IconButton(
                //icon: const Icon(
                //Icons.refresh,
                //color: Colors.white,
                //),
                // onPressed: () => setState(() {futureTrainingList = getTrainings();}),
                // )
                // ]
              ),
              body: Column(
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await Future.delayed(Duration(seconds: 1));
                          setState(() {futureTrainingList = getTrainings();});
                        },
                        child: ListView.separated(
                          padding: const EdgeInsets.all(16.0),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              _buildRow(snapshot.data.trainingList[index], index),
                          separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xFF40916C),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color:  Color.fromRGBO(34, 40, 47, 1),
                            size: 30,
                          ), onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => PaginaCreacion0())),
                        ),
                      ),
                    ),
                  ]
              ),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: const Color(0xFF40916C),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.fitness_center),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month_rounded),
                    label: '',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.white,
                onTap: _onItemTapped,
              ),
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

