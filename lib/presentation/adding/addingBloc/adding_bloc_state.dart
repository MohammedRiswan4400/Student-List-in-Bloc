part of 'adding_bloc_bloc.dart';

class AddingBlocState {
  final String imagePath;

  AddingBlocState({required this.imagePath});
}

class IntialState extends AddingBlocState {
  IntialState() : super(imagePath: "");
}
