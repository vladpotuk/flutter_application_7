import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkModeEnabled = false;

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void toggleTheme() {
    _isDarkModeEnabled = !_isDarkModeEnabled;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            title: 'Theme Switcher',
            theme: themeNotifier.isDarkModeEnabled
                ? ThemeData.dark()
                : ThemeData.light(),
            home: ThemeSwitcherPage(),
          );
        },
      ),
    );
  }
}

class ThemeSwitcherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Switcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Switch Theme:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Consumer<ThemeNotifier>(
              builder: (context, themeNotifier, child) {
                return Switch(
                  value: themeNotifier.isDarkModeEnabled,
                  onChanged: (value) {
                    themeNotifier.toggleTheme();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
