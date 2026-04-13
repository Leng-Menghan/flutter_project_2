import 'package:flutter/material.dart';
import 'ui/screens/map/widgets/map_content.dart';
import 'ui/screens/pass/widgets/pass_content.dart';
import 'ui/screens/profile/widgets/profile_content.dart';
import 'ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 2;

  final List<Widget> _pages = [PassContent(), MapContent(), ProfileContent()];

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(
        body: _pages[_currentIndex],
    
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: AppColors.label,
          items: [
             BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: 'Pass',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}


