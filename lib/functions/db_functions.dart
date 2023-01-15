import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import '../model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addSudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>("student_db");

  studentListNotifier.value.add(value);
  studentDB.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>("student_db");
  studentListNotifier.value.clear();

  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>("student_db");
  await studentDB.delete(id);
  getAllStudents();
}

Future<void> editStudent(int id, StudentModel value) async {
  final studentD = await Hive.openBox<StudentModel>("student_db");
  await studentD.put(id, value);
  getAllStudents();
}
