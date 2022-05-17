import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_trainer/training.dart';

final http.Client client = http.Client();
// better than http.get() if multiple requests to the same server

// If you connect the Android emulator to the webserver listening to localhost:8080
const String baseUrl = "http://10.0.2.2:8080";


// If instead you want to use a real phone, run this command in the linux terminal
//   ssh -R joans.serveousercontent.com:80:localhost:8080 serveo.net
//const String baseUrl = "https://joans.serveousercontent.com";

Future<TrainingList> getTrainings() async {
  String uri = "$baseUrl/get_trainings";
  Uri myUri = Uri.parse(uri);
  final response = await client.get(myUri);
  if (response.statusCode == 200) {
    // print("statusCode=$response.statusCode");
    // print(utf8.decode(response.bodyBytes)) as Map;
    // If the server did return a 200 OK response, then parse the JSON.
    Map<String, dynamic> decoded = convert.jsonDecode(utf8.decode(response.bodyBytes));
    return TrainingList(decoded);
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    // print("statusCode=$response.statusCode");
    throw Exception('Failed to get trainings');
  }
}

void generateTraining(int location, int type, int part) async {
  String uri = "$baseUrl/generate_training?$location?$type?$part";
  Uri myUri = Uri.parse(uri);
  final response = await client.get(myUri);
  if (response.statusCode == 200) {
    // print("statusCode=$response.statusCode");
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    // print("statusCode=$response.statusCode");
    throw Exception('Failed to generate training');
  }
}

Future<ExerciseList> getExercises() async {
  String uri = "$baseUrl/get_exercises";
  Uri myUri = Uri.parse(uri);
  final response = await client.get(myUri);
  if (response.statusCode == 200) {
    // print("statusCode=$response.statusCode");
    // print(utf8.decode(response.bodyBytes)) as Map;
    // If the server did return a 200 OK response, then parse the JSON.
    Map<String, dynamic> decoded = convert.jsonDecode(utf8.decode(response.bodyBytes));
    return ExerciseList(decoded);
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    // print("statusCode=$response.statusCode");
    throw Exception('Failed to get exercises');
  }
}

String convertToString(List<Exercise> exs){
  String exercises = "";
  for (var ex in exs){
    String e = "";
    e += ex.id.toString();
    e += "-";
    exercises += e;
  }
  print(exercises);
  return exercises.substring(0, exercises.length-1);
}

void createTraining(String name, String date, List<Exercise> exercises) async {
    // convert the exercise list to json
    print("Longitud: " + exercises.length.toString());
    String exs = convertToString(exercises);
    String uri = "$baseUrl/create_training?$name?$date?$exs";
    Uri myUri = Uri.parse(uri);
    final response = await client.get(myUri);
    if (response.statusCode == 200) {
      // print("statusCode=$response.statusCode");
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      // print("statusCode=$response.statusCode");
      throw Exception('Failed to create training');
    }
}

void editExercise(int trainingId, Exercise e) async {
  int exerciseId = e.id;
  double weight = e.weight;
  int series = e.series;
  int repes = e.repes;
  String uri = "$baseUrl/edit_exercise?$trainingId?$exerciseId?$weight?$series?$repes";
  Uri myUri = Uri.parse(uri);
  final response = await client.get(myUri);
  if (response.statusCode == 200) {
    // print("statusCode=$response.statusCode");
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    // print("statusCode=$response.statusCode");
    throw Exception('Failed to create training');
  }
}

void editTraining(Training t) async {
  int trainingId = t.id;
  String name = t.name;
  String date = t.date;
  String uri = "$baseUrl/edit_training?$trainingId?$name?$date";
  Uri myUri = Uri.parse(uri);
  final response = await client.get(myUri);
  if (response.statusCode == 200) {
    // print("statusCode=$response.statusCode");
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    // print("statusCode=$response.statusCode");
    throw Exception('Failed to create training');
  }
}
