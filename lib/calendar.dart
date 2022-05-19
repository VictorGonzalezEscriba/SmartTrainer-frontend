import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_trainer/requests.dart';
import 'package:smart_trainer/training.dart';
import 'package:table_calendar/table_calendar.dart';
import 'detalleEntrenamientoFake.dart';
import 'main.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key key}) : super(key: key);

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  DateTime selectedCalendarDate;
  int _selectedIndex = 1;
  Map<DateTime, List<Training>> myTrainings;
  Future<TrainingList> futureTrainingList;

  void _getMapFormat(TrainingList tl) {
    for (Training t in tl.trainingList){
      DateTime d = t.getRealDate();
      if (myTrainings.containsKey(d)){
        myTrainings[d].add(t);
      }
      else{
        myTrainings[d] = [t];
      }
      print(myTrainings);
    }
  }

  void initState() {
    super.initState();
    selectedCalendarDate = _focusedDay;
    myTrainings = {};
    futureTrainingList = getTrainings().then((result) {
      // print(items.length);
      setState(() {
          _getMapFormat(result);
        });
      return result;
    }, onError: (e){
      return e;
    });
  }

  List<Training> _listOfDayEvents(DateTime day){
    return myTrainings[day] ?? [];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // print(_selectedIndex);
      if (_selectedIndex == 0) {
        Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const MyApp()));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 40, 47, 1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF40916C),
        automaticallyImplyLeading: false,
        title: const Text("Smart Trainer", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.white, fontSize:22)),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: const Color.fromRGBO(34, 40, 47, 1),
              margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              elevation: 5.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide( color: Color(0xFF40916C), width: 2.0),
            ),
            child: TableCalendar(
              eventLoader: _listOfDayEvents,
              locale: Localizations.localeOf(context).languageCode,
              headerStyle: const HeaderStyle(
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFF40916C),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                    )),
                formatButtonTextStyle: TextStyle(color: Color(0xFF40916C), fontSize: 16.0),
                formatButtonDecoration: BoxDecoration(
                  color: Color.fromRGBO(34, 40, 47, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ), ),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 28,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              daysOfWeekHeight: 40.0,
              rowHeight: 60.0,
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(fontSize: 18, color: Color(0xFF40916C)),
                  weekdayStyle: TextStyle(fontSize: 18, color: Colors.white)
              ),
              calendarStyle: CalendarStyle(
                canMarkersOverflow: true,
                markerDecoration: const BoxDecoration(color: Color.fromRGBO(123, 44, 191, 1), shape: BoxShape.circle),
                defaultTextStyle: const TextStyle(fontSize: 18, color: Colors.white),
                weekendTextStyle: const TextStyle(fontSize: 18, color: Color(0xFF40916C)),
                outsideDaysVisible: false,
                todayDecoration: BoxDecoration(
                  color: const Color.fromRGBO(34, 40, 47, 1),
                  border: Border.all(width: 2.0, color: const Color(0xFF40916C)),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Color(0xFF40916C),
                  shape: BoxShape.circle,
                ),
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,

              selectedDayPredicate: (day) {
                // Use `selectedDayPredicate` to determine which day is currently selected.
                // If this returns true, then `day` will be marked as selected.

                // Using `isSameDay` is recommended to disregard
                // the time-part of compared DateTime objects.
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Call `setState()` when updating the selected day
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                _focusedDay = focusedDay;
              },
            ),
            ),
            ..._listOfDayEvents(_selectedDay).map(
                  (Training) => Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Container(
                      decoration: BoxDecoration(
                          color:const Color(0x1BFFFFFF),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: ListTile(
                          leading: const Icon(
                            Icons.fitness_center,
                            color: Colors.white,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(Training.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, )),
                          ),
                          subtitle: Text("Nº de ejercicios: " + Training.exercises.length.toString(), style: const TextStyle(color: Colors.white60, fontWeight: FontWeight.bold, )),
                          onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => detalleEntrenamiento2(Training))),
                        ),
                      ),
                    ),
                  )
            ),
          ],
        ),
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
  }
}
