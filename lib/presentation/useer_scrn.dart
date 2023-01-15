import 'dart:io';
import 'package:a/model/data_model.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({
    super.key,
    required this.data,
  });
  final StudentModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 85),
          child: Text("User"),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: FileImage(File(data.image)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
                child: Text(
              "Name: ${data.name}",
              style: TextStyle(fontSize: 22),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
                child: Text(
              "Age: ${data.age}",
              style: TextStyle(fontSize: 18),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
                child: Text(
              "E-mail: ${data.email}",
              style: const TextStyle(fontSize: 18),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
                child: Text(
              "Phone: ${data.phone}",
              style: const TextStyle(fontSize: 18),
            )),
          )
        ],
      ),
    );
  }
}
