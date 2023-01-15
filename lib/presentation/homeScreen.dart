import 'package:a/functions/db_functions.dart';
import 'package:a/presentation/adding/adding.dart';
import 'package:a/presentation/adding/addingBloc/adding_bloc_bloc.dart';
import 'package:a/presentation/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'list_student.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: Text("View Students"),
        ),
        // backgroundColor: Color.fromARGB(242, 0, 0, 0),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                gotosearch();
              },
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
      body: const ListStudentWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddStudent(),
              ));
          BlocProvider.of<AddingBlocBloc>(context).add(AddingImage(image: ""));
          // gotoadding();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> gotoadding() async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => AddStudent(),
    ));
  }

  Future<void> gotosearch() async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (cnt) => const SearchStudent(),
    ));
  }
}
