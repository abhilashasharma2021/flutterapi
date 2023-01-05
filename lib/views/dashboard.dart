import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapi/views/home.dart';
import 'package:flutterapi/views/friend.dart';
import 'package:flutterapi/views/location.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor:Color(0xFF167F67),
          centerTitle: true,
        title: new Text(
            'Bottom Navigation Bar',
        style: new TextStyle(color: const Color(0xFFFFFFFF)),
    ),
        ),
      body: new PageView(
        children: [
          new Home('Home Screen', listType: '',),
          new Location("Location screen", listType: '',),
          new Friend("Friends screen", listType: '',),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),

      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: const Color(0xFF167F67),

        ), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          unselectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
          selectedIconTheme: IconThemeData(color: Colors.white, size: 25),
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,

                ),
             label: 'Home'),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.location_on,

                ),
             label: 'Location'),
            new BottomNavigationBarItem(
                icon: new Icon(
                  Icons.people,

                ),
                label: 'People'
                 )
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }
}

