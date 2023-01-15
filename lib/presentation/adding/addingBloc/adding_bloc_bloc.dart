import 'package:flutter_bloc/flutter_bloc.dart';

part 'adding_bloc_event.dart';
part 'adding_bloc_state.dart';

class AddingBlocBloc extends Bloc<AddingStudentEvent, AddingBlocState> {
  AddingBlocBloc() : super(IntialState()) {
    on<AddingImage>((event, emit) {
      final studentimage = AddingBlocState(imagePath: event.image);
      emit(studentimage);
      // TODO: implement event handler
    });
  }
}
