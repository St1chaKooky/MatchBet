import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';

import '../../router/router.dart';

@RoutePage()
class NavigationBarScreen extends StatelessWidget {
  NavigationBarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        MainRoute(),
        ListMatchRoute(),
        AccountRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: whiteColor,
            currentIndex: tabsRouter.activeIndex,
            elevation: 0,
            selectedItemColor: primaryColor,
            unselectedItemColor: bottomBarColor,
            onTap: (index) => openPage(index, tabsRouter),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }

  void openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
