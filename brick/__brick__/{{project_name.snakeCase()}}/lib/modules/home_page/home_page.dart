import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/inject/router/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // list of your tab routes
      // routes used here must be declaraed as children
      // routes of /dashboard
      routes: [
        const CounterRoute(),
        GithubRoute(),
        const SettingRoute(),
      ],
      transitionBuilder: (context, child, animation) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        //alterntivly you could use a global key
        return Scaffold(
          body: FadeTransition(
            opacity: animation,
            // the passed child is techinaclly our animated selected-tab page
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              // here we switch between tabs
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Users',
                icon: Icon(
                  Icons.people,
                ),
              ),
              BottomNavigationBarItem(
                label: 'github',
                icon: Icon(
                  Icons.local_activity,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(
                  Icons.settings,
                ),
              )
            ],
          ),
        );
      },
    );
    // return AutoTabsScaffold(
    //   routes: const [
    //     CounterRoute(),
    //   ],
    //   bottomNavigationBuilder: (_, tabsRouter) {
    //     return BottomNavigationBar(
    //       currentIndex: tabsRouter.activeIndex,
    //       onTap: tabsRouter.setActiveIndex,
    //       items: const [
    //         BottomNavigationBarItem(
    //           label: 'Users',
    //           icon: Icon(
    //             Icons.people,
    //           ),
    //         )
    //         // BottomNavigationBarItem(label: 'Posts),
    //         // BottomNavigationBarItem(label: 'Settings'),
    //       ],
    //     );
    //   },
    // );
  }
}

@RoutePage()
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
