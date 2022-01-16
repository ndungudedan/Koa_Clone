import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koa_clone/constants/styles.dart';
import 'package:koa_clone/ui/create_pin_screen.dart';
import 'package:koa_clone/ui/index/home/home_screen.dart';
import 'package:koa_clone/ui/index/more/more_screen.dart';
import 'package:koa_clone/ui/index/save/save_screen.dart';

class IndexScreen extends StatefulWidget {
  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  Color? _bottomNavBackgroundColor = kLightTeal;
  final List<Widget> _content = [HomeScreen(), SaveScreen(), MoreScreen()];

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
    if (state == AppLifecycleState.resumed) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreatePin()));
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Material(child: _content[_selectedIndex]),
      Align(
        alignment: Alignment.bottomCenter,
        child: BottomNavigationBar(
            backgroundColor: _bottomNavBackgroundColor,
            currentIndex: _selectedIndex,
            selectedItemColor: kDarkGreyColor,
            onTap: (index) {
              _selectedIndex = index;

              if (index == 1) {
                _bottomNavBackgroundColor = kTransaparentTeal;
              } else {
                _bottomNavBackgroundColor = kLightTeal;
              }
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home_filled,
                  color: kDarkGreyColor,
                ),
              ),
              BottomNavigationBarItem(
                  label: 'Save',
                  icon: Icon(
                    Icons.add_box_rounded,
                    color: kDarkGreyColor,
                  )),
              BottomNavigationBarItem(
                label: 'More',
                icon: Icon(
                  Icons.settings,
                  color: kDarkGreyColor,
                ),
              )
            ]),
      ),
    ]);
  }
}
