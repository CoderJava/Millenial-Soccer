import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:millenial_soccer/values/color_assets.dart';

import 'ui/match/match_screen.dart';
import 'ui/news/news_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _indexTabSelected = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorAssets.primarySwatchColor,
        accentColor: ColorAssets.accentColor,
      ),
      home: Scaffold(
        body: _buildBodyWidget(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indexTabSelected,
          items: [
            BottomNavigationBarItem(
              title: Text("News"),
              icon: Icon(FontAwesomeIcons.newspaper),
            ),
            BottomNavigationBarItem(
              title: Text("Match"),
              icon: Icon(FontAwesomeIcons.futbol),
            )
          ],
          onTap: (indexTabSelected) {
            setState(() => _indexTabSelected = indexTabSelected);
          },
        ),
      ),
    );
  }

  Widget _buildBodyWidget() {
    if (_indexTabSelected == 0) {
      return NewsScreen();
    } else if (_indexTabSelected == 1) {
      return MatchScreen();
    }
  }
}
