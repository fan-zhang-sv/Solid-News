import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_tracker/Pages/FollowingPage.dart';
import 'package:news_tracker/Pages/TopNewsPage.dart';
import 'package:news_tracker/Pages/SearchNewsPage.dart';
import 'package:news_tracker/Pages/MePage.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          TopNewsPage(),
          SearchNewsPage(),
          FollowingPage(),
          MePage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Color(0x2666666), blurRadius: 10)]),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            getBotttomBarItem(FaIcon(FontAwesomeIcons.newspaper), 'Top News'),
            getBotttomBarItem(FaIcon(FontAwesomeIcons.globeAmericas), 'Search'),
            getBotttomBarItem(FaIcon(FontAwesomeIcons.star), 'Following'),
            getBotttomBarItem(FaIcon(FontAwesomeIcons.user), 'Me'),
          ],
          currentIndex: _currentIndex,
          elevation: 8.0,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

BottomNavigationBarItem getBotttomBarItem(FaIcon icon, String name) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: icon,
    ),
    title: Text(name),
  );
}
