import 'dart:io';

import 'package:a/functions/db_functions.dart';
import 'package:a/presentation/edditingStudent/edit_screen.dart';
import 'package:a/presentation/useer_scrn.dart';
import 'package:flutter/material.dart';

import '../model/data_model.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            //   final keys = Hive.box('student_db').keys.toList();
            return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => User(
                              data: data,
                            )),
                  );
                },
                leading: CircleAvatar(
                  backgroundImage: FileImage(File(data.image)),
                ),
                title: Text(data.name),
                subtitle: Text(data.age),
                // leading: CircleAvatar(backgroundImage: data.image),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Edit(student: data);
                              },
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                      onPressed: () {
                        deleteStudent(data.key);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ));
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
