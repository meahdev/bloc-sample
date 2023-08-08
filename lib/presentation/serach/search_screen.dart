import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/bloc/search/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    context.read<SearchBloc>().add(const SearchEvent.initialize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Loader Showing"),
                    SizedBox(
                      height: 5,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            } else if (state.idlList.isNotEmpty) {
              return const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Initial Search Api call done"),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            } else if (state.searchLIst.isNotEmpty) {
              return const Center(child: Text("Showing Search Results"));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
