import 'dart:developer';
import 'dart:io';
import 'package:a/functions/db_functions.dart';
import 'package:a/model/data_model.dart';
import 'package:a/presentation/adding/addingBloc/adding_bloc_bloc.dart';
import 'package:a/presentation/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});
  String? imageAvatar;
  Future pickimage({required BuildContext context}) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    imageAvatar = image.path;
    BlocProvider.of<AddingBlocBloc>(context)
        .add(AddingImage(image: image.path));

    ///////////////////////////
  }

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double get radius => 22.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading:
        // Icon(
        //   Icons.arrow_back_ios_new_sharp),
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text("Add Student"),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                backtohome(context);
              },
            );
          },
        ),

        // backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: BlocBuilder<AddingBlocBloc, AddingBlocState>(
                  builder: (context, state) {
                    return CircleAvatar(
                      radius: 60,

                      // backgroundColor: Colors.yellow,
                      backgroundImage: (state.imagePath.isNotEmpty)
                          ? FileImage(
                              File(state.imagePath),
                            )
                          : AssetImage("assets/images/avatar3.jpg")
                              as ImageProvider,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 90, top: 90),
                        child: GestureDetector(
                          onTap: () {
                            pickimage(context: context);
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
                      return null;
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
                        // return "Phone number is empty";
                      }
                      return null;
                    },
                    // controller: _phoneController,

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
                      child: Text('Add Student'),
                      // color: Colors.purpleAccent,
                      // shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          onAddStudentButtenClicked(context);
                        }

                        // log('hauhadad');
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

  Future<void> backtohome(BuildContext context) async {
    Navigator.of(context).pop(MaterialPageRoute(
      builder: (ctx1) => HomeSceen(),
    ));
  }

  newRoundedRectangleBorder(BorderRadius borderRadius) {}

  void onAddStudentButtenClicked(BuildContext context) {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _email = _emailController.text.trim();
    final _phone = _phoneController.text.trim();

    // log('sadasdasdasdasdasdasdasdasd');
    if (_name.isEmpty ||
        _age.isEmpty ||
        _email.isEmpty ||
        _phone.isEmpty ||
        imageAvatar!.isEmpty) {
      return;
    }
    // log('11111111111111111111111111111111111111');
    // print("$_name $_age");

    final _student = StudentModel(
        name: _name,
        age: _age,
        email: _email,
        phone: _phone,
        image: imageAvatar!);
    log(_student.name);
    addSudent(_student);
    showAddedSnackbar(context);
    // Navigator.pop(context);
    gobacktoHome(context);
  }

  gobacktoHome(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pop(context);
  }

  showAddedSnackbar(BuildContext context) {
    final _errorMessage = "Add Successfully";
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
