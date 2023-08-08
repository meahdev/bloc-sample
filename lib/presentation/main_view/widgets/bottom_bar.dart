import 'package:flutter/material.dart';

import 'custom_icon.dart';

ValueNotifier<int> indexChanges = ValueNotifier<int>(0);

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChanges,
        builder: (context, int index, _) {
          return BottomNavigationBar(
            currentIndex: index,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            selectedIconTheme: const IconThemeData(color: Colors.white),
            onTap: (int index) {
              indexChanges.value = index;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: CustomIcon(
                    icon: Icons.search,
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: CustomIcon(
                    icon: Icons.download,
                  ),
                  label: "Downloads")
            ],
          );
        });
  }
}
