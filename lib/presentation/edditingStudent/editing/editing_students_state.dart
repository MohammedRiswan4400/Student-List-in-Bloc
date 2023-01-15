part of 'editing_students_bloc.dart';

class EditingStudentsState {
  final String image;

  EditingStudentsState({
    required this.image,
  });
}

class InitialState extends EditingStudentsState {
  InitialState() : super(image: '');
}
