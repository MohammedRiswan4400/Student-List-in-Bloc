import 'dart:io';
import 'package:a/presentation/search/search_screen/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchStudent extends StatelessWidget {
  const SearchStudent({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<SearchBloc>(context).add(
        SearchInitialList(),
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 38),
          child: Text("Search Students"),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: TextFormField(
                onChanged: (value) {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchDoneValue(searchValue: value));
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(62, 177, 177, 177),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(62, 177, 177, 177)),
                        borderRadius: BorderRadius.circular(50)),
                    prefixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(Icons.search_rounded),
                    ),
                    hintText: "Search Names")),
          ),
          SizedBox(
            height: 20.0,
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return Expanded(
                  child: (state.studentSearchResultList.isNotEmpty)
                      ? ListView.builder(
                          itemCount: state.studentSearchResultList.length,
                          itemBuilder: ((context, index) {
                            final data = state.studentSearchResultList[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(File(state
                                    .studentSearchResultList[index].image)),
                              ),
                              title: Text(
                                  state.studentSearchResultList[index].name),
                              subtitle: Text(
                                  state.studentSearchResultList[index].age),
                            );
                          }),
                        )
                      : const Center(child: Text(" Not found")));
            },
          ),
        ],
      ),
    );
  }
}
