import 'package:a/model/data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitiaState()) {
    List<StudentModel> studentList =
        Hive.box<StudentModel>('student_db').values.toList();
    List<StudentModel> displayStudent = List<StudentModel>.from(studentList);

    on<SearchInitialList>((event, emit) {
      return emit(
        SearchState(
          studentList: Hive.box<StudentModel>('student_db').values.toList(),
          studentSearchResultList:
              Hive.box<StudentModel>('student_db').values.toList(),
        ),
      );
    });

    on<SearchDoneValue>((event, emit) {
      displayStudent = studentList
          .where((element) => element.name
              .toLowerCase()
              .contains(event.searchValue.toLowerCase()))
          .toList();

      emit(SearchState(
          studentList: studentList, studentSearchResultList: displayStudent));
    });
  }
}
