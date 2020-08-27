import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsoft_intern_mock_project/constants/styles.dart';
import 'package:fsoft_intern_mock_project/screens/home_screen.dart';
import 'package:fsoft_intern_mock_project/screens/login_screen.dart';
import 'package:fsoft_intern_mock_project/simple_bloc_observer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Garden App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Styles.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final SharedPreferences sharedPreferences = snapshot.data;
            if (sharedPreferences.getString("username") == null) {
              return LoginScreen();
            } else {
              return HomeScreen(sharedPreferences.getString("username"));
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
