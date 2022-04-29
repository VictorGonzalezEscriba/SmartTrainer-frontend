import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smart_trainer/requests.dart';
import 'package:smart_trainer/training.dart';
import 'creacion0.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<TrainingList> futureTrainingList;
  int _selectedIndex = 0;
  @override
  void initState(){
    futureTrainingList = getTrainings();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
              // onTap: () =>
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
                title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
                centerTitle: true,
                elevation: 2,
              ),
                    body: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(16.0),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) =>
                                _buildRow(snapshot.data.trainingList[index], index),
                            separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                          ),
                        ),
                        const Padding(
                          padding:  EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xFF40916C),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color:  Color.fromRGBO(34, 40, 47, 1),
                                size: 30,
                              ),
                            )
                        ),),
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
