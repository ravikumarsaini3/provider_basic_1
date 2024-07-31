import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic_example/provider/theme_provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themechange = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Change'),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: const Text('Light theme'),
              value: ThemeMode.light,
              groupValue: themechange.thememode,
              onChanged: themechange.settheme),
          RadioListTile<ThemeMode>(
              title: const Text('Dark theme'),
              value: ThemeMode.dark,
              groupValue: themechange.thememode,
              onChanged: themechange.settheme),
          RadioListTile<ThemeMode>(
              title: const Text('System theme'),
              value: ThemeMode.system,
              groupValue: themechange.thememode,
              onChanged: themechange.settheme),
          const Text('data')
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        //  selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
