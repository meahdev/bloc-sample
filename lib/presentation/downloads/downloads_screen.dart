import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/bloc/downloads/downloads_bloc.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  @override
  void initState() {
    context.read<DownloadsBloc>().add(const DownloadsEvent.getDownloadImage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<DownloadsBloc, DownloadsState>(
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
            } else {
              return const Center(
                  child: Text("Initial Downloads Api call done"));
            }
          },
        ),
      ),
    );
  }
}
