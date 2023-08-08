import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/presentation/main_view/main_screen.dart';
import 'package:sample_bloc/presentation/serach/search_screen.dart';

import 'application/bloc/downloads/downloads_bloc.dart';
import 'application/bloc/search/search_bloc.dart';
import 'infrastructure/dowonloads/download_repository.dart';
import 'infrastructure/search/search_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SearchBloc(SearchRepository(), DownloadRepository()),
          child: const SearchScreen(),
        ),
        BlocProvider(create: (_) => DownloadsBloc(DownloadRepository()))
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              backgroundColor: Colors.black,
              scaffoldBackgroundColor: Colors.black,
              textTheme: const TextTheme(
                  bodyText1: TextStyle(color: Colors.white),
                  bodyText2: TextStyle(color: Colors.white))),
          home: const MainScreen()),
    );
  }
}
