import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:smart_trainer/requests.dart';

class TrainingList {
  List<Training> trainingList = [];
  int length = 0;
  TrainingList(Map<String, dynamic> dec) {
    List list = dec["trainings"];
    for (var element in list) {
      Training t = Training(element["tId"], element["tName"], element["type"], element["nExercises"], element["date"]);
      List exerciseList = element["exercises"];
      for (var el in exerciseList) {
        Exercise e = Exercise(el["id"], el["name"], el["location"], el["bodyPart1"], el["bodyPart2"], el["bodyPart3"], el["link"], el["weight"], el["series"], el["repes"]);
        t.addExercise(e);
      }
      trainingList.add(t);
      length += 1;
    }
  }

  Training getIndex(int index){
    return trainingList[index];
  }
}

class Training {
  int id;
  String name;
  int type;
  int nExercises;
  List<Exercise> exercises = [];
  String date;

  Training(this.id, this.name, this.type, this.nExercises, this.date);

  void addExercise(Exercise e){
    exercises.add(e);
  }
}

class Exercise {
  int id;
  String name;
  int location;
  int bodyPart1;
  String bodyPart2;
  String bodyPart3;
  String link;
  int weight;
  int series;
  int repes;

  Exercise(this.id, this.name, this.location, this.bodyPart1, this.bodyPart2, this.bodyPart3, this.link, this.weight, this.series, this.repes);
}