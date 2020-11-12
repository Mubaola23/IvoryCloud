import 'package:flutter/material.dart';

import '../../core/constants.dart';

class NavBar extends StatefulWidget {
  final Function(int) onTabSelected;

  const NavBar({Key key, this.onTabSelected}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            NavItem(
              currentIndex: _selectedIndex,
              positionIndex: 0,
              iconData: Icons.home_outlined,
              onTap: (index) => _updateIndex(index),
            ),
            SizedBox(width: 32.0),
            NavItem(
              currentIndex: _selectedIndex,
              positionIndex: 1,
              iconData: Icons.search,
              onTap: (index) => _updateIndex(index),
            ),
            SizedBox(width: 32.0),
            NavItem(
              currentIndex: _selectedIndex,
              positionIndex: 2,
              iconData: Icons.person_outlined,
              onTap: (index) => _updateIndex(index),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final int positionIndex, currentIndex;
  final IconData iconData;
  final Function(int) onTap;

  const NavItem({
    this.currentIndex,
    this.positionIndex,
    this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(positionIndex),
      child: CircleAvatar(
        radius: 27,
        backgroundColor: kPrimaryColor,
        child: CircleAvatar(
          radius: 25,
          backgroundColor:
              positionIndex == currentIndex ? kPrimaryColor : Colors.white,
          child: Icon(
            iconData,
            size: 30,
            color: positionIndex == currentIndex ? Colors.white : kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
