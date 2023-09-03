import 'package:fluffy_train/modules/home/ui/home_page.dart';
import 'package:fluffy_train/modules/profile/ui/profile_page.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';

enum NavbarPageIndex {
  homePage,
  profilePage,
}

extension NavbarPageIndexExtensionIndex on NavbarPageIndex {
  static const Map<NavbarPageIndex, int> _map = {
    NavbarPageIndex.homePage: 0,
    NavbarPageIndex.profilePage: 1,
  };

  int? get key => _map[this];
}

extension NavbarPageIndexExtensionString on NavbarPageIndex {
  static const Map<NavbarPageIndex, String> _map = {
    NavbarPageIndex.homePage: 'home',
    NavbarPageIndex.profilePage: 'profile',
  };

  String? get string => _map[this];
}

Widget buildNavBar(
  NavbarPageIndex? currentPage,
  BuildContext context,
  Function? onTouch,
) {
  int currentIndex = currentPage?.key ?? 0;

  return BottomNavigationBar(
    backgroundColor: DefaultTheme.grayscale[Grayscale.white],
    selectedItemColor: Colors.blue,
    unselectedItemColor: DefaultTheme.grayscale[Grayscale.gray],
    currentIndex: currentIndex,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    onTap: (index) {
      if (onTouch != null) {
        onTouch();
      }
      if (currentPage?.key == index) {
        return;
      }
      {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const HomePage(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const ProfilePage(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
            break;
        }
      }
    },
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Perfil',
      ),
    ],
  );
}
