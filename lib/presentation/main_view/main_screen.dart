import 'package:flutter/material.dart';
import 'package:sample_bloc/presentation/main_view/widgets/bottom_bar.dart';

import '../downloads/downloads_screen.dart';
import '../serach/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final List<Widget> pages = [const SearchScreen(), const DownloadsScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ValueListenableBuilder(
              valueListenable: indexChanges,
              builder: (context, int index, _) {
                return pages[index];
              }),
          // bottomNavigationBar: const BottomBar(),
          bottomNavigationBar: const BottomBar()),
    );
  }
}
