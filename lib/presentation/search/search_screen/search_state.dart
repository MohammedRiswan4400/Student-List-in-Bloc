part of 'search_bloc.dart';

class SearchState {
  final List<StudentModel> studentList;
  final List<StudentModel> studentSearchResultList;

  SearchState(
      {required this.studentList, required this.studentSearchResultList});
}

class InitiaState extends SearchState {
  InitiaState() : super(studentList: [], studentSearchResultList: []);
}
