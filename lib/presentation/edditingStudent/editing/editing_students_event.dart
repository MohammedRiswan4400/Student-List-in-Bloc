part of 'editing_students_bloc.dart';

abstract class EditingStudentsEvent {}

class UpdateEditedImage extends EditingStudentsEvent {
  final String updateImage;
  UpdateEditedImage({required this.updateImage});
}
