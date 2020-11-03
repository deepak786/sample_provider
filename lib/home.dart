import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/counter.dart';
import 'package:sample_provider/models/user_model.dart';
import 'package:sample_provider/reg_screen1.dart';
import 'package:sample_provider/reg_screen2.dart';
import 'package:sample_provider/reg_screen3.dart';
import 'package:sample_provider/reg_screen4.dart';
import 'package:sample_provider/reg_screen5.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text("1. Counter Model with listen true"),
            onTap: () {
              goToCounter(context, true);
            },
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),
          ListTile(
            title: Text("2. Counter Model with listen false"),
            onTap: () {
              goToCounter(context, false);
            },
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),
          ListTile(
            title: Text("3. Registration Process (normal)"),
            onTap: () {
              goToScreen1(context, false);
            },
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),
          ListTile(
            title: Text("4. Registration Process (nested navigator)"),
            onTap: () {
              goToScreen1(context, true);
            },
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }

  /// go to counter screen
  void goToCounter(BuildContext context, bool listen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Counter(listen: listen);
        },
      ),
    );
  }

  /// go to register screen 1
  void goToScreen1(BuildContext context, bool separatorNavigator) {
    if (separatorNavigator) {
      // open the screen 1 by separator navigator
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            final navigationKey = GlobalKey<NavigatorState>();
            return ChangeNotifierProvider<UserModel>(
              // We create a new user model provider
              create: (context) =>
                  UserModel()..separateNavigator = separatorNavigator,
              child: WillPopScope(
                onWillPop: () async =>
                    !await navigationKey.currentState.maybePop(),
                child: Navigator(
                  key: navigationKey,
                  onGenerateRoute: (RouteSettings settings) {
                    switch (settings.name) {
                      case "/screen2":
                        return MaterialPageRoute(
                          builder: (BuildContext context) {
                            return RegScreen2();
                          },
                        );
                      case "/screen3":
                        return MaterialPageRoute(
                          builder: (BuildContext context) {
                            return RegScreen3();
                          },
                        );
                      case "/screen4":
                        return MaterialPageRoute(
                          builder: (BuildContext context) {
                            return RegScreen4();
                          },
                        );
                      case "/screen5":
                        return MaterialPageRoute(
                          builder: (BuildContext context) {
                            return RegScreen5();
                          },
                        );
                      default:
                        // by default go to screen1
                        return MaterialPageRoute(
                          builder: (BuildContext context) {
                            return RegScreen1();
                          },
                        );
                    }
                  },
                  reportsRouteUpdateToEngine: true,
                ),
              ),
            );
          },
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return ChangeNotifierProvider(
              create: (_) =>
                  UserModel()..separateNavigator = separatorNavigator,
              child: RegScreen1(),
            );
          },
        ),
      );
    }
  }
}
