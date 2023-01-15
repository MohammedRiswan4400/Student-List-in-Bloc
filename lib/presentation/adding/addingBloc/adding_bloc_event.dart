part of 'adding_bloc_bloc.dart';

abstract class AddingStudentEvent {}

class AddingImage extends AddingStudentEvent {
  final String image;
  AddingImage({required this.image});
}
