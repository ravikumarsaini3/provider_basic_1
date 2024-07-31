import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic_example/provider/favorite_provider.dart';
import 'package:provider_basic_example/provider/provider_container.dart';
import 'package:provider_basic_example/provider/provider_count.dart';
import 'package:provider_basic_example/provider/theme_provider.dart';

import 'package:provider_basic_example/screen/theme_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Countprovider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProviderContainer(),
          ),
          ChangeNotifierProvider(create: (context) => FavoriteProvider()),
          ChangeNotifierProvider(create: (context) => ThemeProvider())
        ],
        child: Builder(
          builder: (context) {
            final themechange = Provider.of<ThemeProvider>(context);
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                themeMode: themechange.thememode,
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Color.fromARGB(255, 60, 89, 113),
                  ),
                  brightness: Brightness.light,
                  primaryColor: Colors.white,
                  primarySwatch: Colors.green,
                  textTheme: const TextTheme(
                    displayLarge: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    bodyLarge: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                  buttonTheme: const ButtonThemeData(
                    buttonColor: Colors.green,
                    textTheme: ButtonTextTheme.primary,
                  ),
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.brown,
                  primaryColor: Colors.blueGrey,
                  appBarTheme: AppBarTheme(
                    backgroundColor: Colors.blueGrey.shade900,
                  ),
                  textTheme: const TextTheme(
                    displayLarge: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    bodyLarge: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70,
                    ),
                  ),
                  buttonTheme: const ButtonThemeData(
                    buttonColor: Colors.brown,
                    textTheme: ButtonTextTheme.primary,
                  ),
                ),
                home: const ThemeScreen());
          },
        ));
  }
}
