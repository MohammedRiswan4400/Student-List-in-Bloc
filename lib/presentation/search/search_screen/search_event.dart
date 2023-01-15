part of 'search_bloc.dart';

class SearchEvent {}

class SearchDoneValue extends SearchEvent {
  final String searchValue;

  SearchDoneValue({required this.searchValue});
}

class SearchInitialList extends SearchEvent {
  SearchInitialList();
}
