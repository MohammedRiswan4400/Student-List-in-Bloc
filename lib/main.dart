import 'dart:io';

import 'package:a/presentation/adding/addingBloc/adding_bloc_bloc.dart';
import 'package:a/presentation/edditingStudent/editing/editing_students_bloc.dart';
import 'package:a/presentation/homeScreen.dart';
import 'package:a/presentation/search/search_screen/search_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/data_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  await Hive.openBox<StudentModel>("student_db");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddingBlocBloc(),
          child: Container(),
        ),
        BlocProvider(create: (context) => EditingStudentsBloc()),
        BlocProvider(create: (context) => SearchBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "rio1",
        theme: ThemeData(primarySwatch: Colors.grey),
        home: HomeSceen(),
      ),
    );
  }
}
