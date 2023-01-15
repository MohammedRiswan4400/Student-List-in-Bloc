import 'dart:developer';
import 'dart:io';

import 'package:a/functions/db_functions.dart';
import 'package:a/model/data_model.dart';
import 'package:a/presentation/edditingStudent/editing/editing_students_bloc.dart';
import 'package:a/presentation/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Edit extends StatelessWidget {
  Edit({super.key, required this.student});
  StudentModel student;

  final _formKey = GlobalKey<FormState>();

  TextEditingController? _nameController;
  TextEditingController? _ageController;
  TextEditingController? _emailController;
  TextEditingController? _phoneController;
  String? _image;

  void initState() {
    // TODO: implement initState
    // super.initState();
    _nameController = TextEditingController(text: student.name);
    _ageController = TextEditingController(text: student.age);
    _emailController = TextEditingController(text: student.email);
    _phoneController = TextEditingController(text: student.phone);
    _image = student.image;
  }

  Future<void> getImage(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    _image = image.path; // final imagetemperory = image.path;
    BlocProvider.of<EditingStudentsBloc>(context)
        .add(UpdateEditedImage(updateImage: _image!));

    log("hhhhhhhh");
  }

  void onEditStudentButtonClicked(context) {
    log('asfdasdfaf');
    final _name = _nameController!.text.trim();
    final _age = _ageController!.text.trim();
    final _email = _emailController!.text.trim();
    final _phone = _phoneController!.text.trim();

    if (_name.isEmpty || _age.isEmpty || _email.isEmpty || _phone.isEmpty) {
      return;
    }
    final _student = StudentModel(
        name: _name, age: _age, email: _email, phone: _phone, image: _image!);
    editStudent(student.key, _student);
    log('aaaaaaaaaaaaaaa');
    showAddedSnackbar(context: context);
    log('''''' 'message' '''''');
    gobacktoHome(context: context);
  }

  @override
  Widget build(BuildContext context) {
    initState();
    BlocProvider.of<EditingStudentsBloc>(context)
        .add(UpdateEditedImage(updateImage: _image!));
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text("Edit User"),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: BlocBuilder<EditingStudentsBloc, EditingStudentsState>(
                  builder: (context, state) {
                    return CircleAvatar(
                      radius: 60,
                      backgroundImage: (_image != null)
                          ? FileImage(
                              File(
                                state.image,
                              ),
                            )
                          : AssetImage("assets/images/avatar3.jpg")
                              as ImageProvider,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 90, top: 90),
                        child: GestureDetector(
                          onTap: () {
                            getImage(context);
                          },
                          child: Icon(Icons.add_a_photo),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, top: 20, right: 50, bottom: 5),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "Name is empty";
                      }
                      return null;
                    },
                    controller: _nameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(62, 177, 177, 177),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(62, 177, 177, 177)),
                            borderRadius: BorderRadius.circular(50)),
                        prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(Icons.account_circle_rounded)),
                        hintText: "Name")

                    // decoration: BoxDecoration()
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                  bottom: 5,
                ),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "Age is empty";
                      }
                      return null;
                    },
                    controller: _ageController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(62, 177, 177, 177),
                        //  icon: Icons.adb_sharp,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(62, 177, 177, 177)),
                            borderRadius: BorderRadius.circular(50)),
                        prefixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Icon(Icons.numbers_rounded),
                        ),
                        hintText: "Age")

                    // decoration: BoxDecoration()
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                  bottom: 5,
                ),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "E-Mail is empty";
                      }
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(62, 177, 177, 177),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(62, 177, 177, 177)),
                            borderRadius: BorderRadius.circular(50)),
                        prefixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Icon(Icons.email),
                        ),
                        hintText: "E-Mail")

                    // decoration: BoxDecoration()
                    ),
              ),
              // SizedBox(
              //   height: 1,
              // ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                  bottom: 5,
                ),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "Phone number is empty";
                      }
                      return null;
                    },
                    controller: _phoneController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(62, 177, 177, 177),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(62, 177, 177, 177)),
                            borderRadius: BorderRadius.circular(50)),
                        prefixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Icon(Icons.phone_android_outlined),
                        ),
                        hintText: "Phone")

                    // decoration: BoxDecoration()
                    ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    // bottom: 5,
                  ),
                  child: ElevatedButton(
                      child: Text('Edit Student'),
                      // color: Colors.purpleAccent,
                      // shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {
                        // onAddStudentButtenClicked();
                        // editStudent(int id, StudentModel value)
                        // log('hauhadad');
                        if (_formKey.currentState!.validate()) {
                          onEditStudentButtonClicked(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  gobacktoHome({required BuildContext context}) async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pop(context);
  }

  showAddedSnackbar({required BuildContext context}) {
    final _errorMessage = "Edit Successfully";
    //snackbar

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color.fromARGB(221, 97, 99, 91),
      margin: EdgeInsets.all(10),
      content: Text(_errorMessage),
      duration: Duration(seconds: 3),
    ));
  }
}
