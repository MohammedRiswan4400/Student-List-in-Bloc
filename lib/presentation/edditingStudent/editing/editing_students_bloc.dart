import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'editing_students_event.dart';
part 'editing_students_state.dart';

class EditingStudentsBloc
    extends Bloc<EditingStudentsEvent, EditingStudentsState> {
  EditingStudentsBloc() : super(InitialState()) {
    on<UpdateEditedImage>((event, emit) {
      emit(EditingStudentsState(image: event.updateImage));
    });
  }
}
