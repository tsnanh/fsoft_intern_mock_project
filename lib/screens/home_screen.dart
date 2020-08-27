import 'package:flutter/material.dart';
import 'package:fsoft_intern_mock_project/constants/styles.dart';
import 'package:fsoft_intern_mock_project/screens/garden_screen.dart';
import 'package:fsoft_intern_mock_project/screens/plant_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  final String name;

  HomeScreen(this.name);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(initialIndex: 0, vsync: this, length: 2);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Garden App",
            style: Styles.headline5.copyWith(color: Styles.primaryColor)),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Styles.primaryColor,
            ),
            tooltip: "Log out",
            onPressed: () {
              SharedPreferences.getInstance().then((value) {
                value.remove("username");
              }).then((value) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              });
            },
          )
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Styles.primaryColor,
          tabs: [
            Tab(
                icon: Icon(Icons.local_florist, color: Styles.primaryColor),
                child: Text(
                  'My Garden',
                  style: TextStyle(color: Styles.primaryColor),
                )),
            Tab(
                icon: Icon(Icons.grass_rounded, color: Styles.primaryColor),
                child: Text('Plant Store',
                    style: TextStyle(color: Styles.primaryColor))),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          GardenScreen(),
          PlantListScreen(),
        ],
      ),
      floatingActionButton: _controller.index == 0
          ? FloatingActionButton.extended(
              backgroundColor: Styles.primaryColor,
              onPressed: () {
                setState(() {
                  _controller.index = 1;
                });
              },
              label: Text('ADD PLANTS'),
              icon: Icon(Icons.add),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.zero,
                ),
              ),
            )
          : null,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
