import 'package:flutter/material.dart';

import '../../core/constants.dart';

class Paginator extends StatelessWidget {
  final int selectedPage;
  final Function(int) onItemTapped;

  Paginator({
    Key key,
    @required this.selectedPage,
    this.onItemTapped,
  }) : super(key: key);

  List<Widget> paginatorIndices() {
    return List<Widget>.generate(
      5,
      (index) {
        if (index + selectedPage - 2 > 0) {
          return InkWell(
            onTap: () => onItemTapped(index + selectedPage - 2),
            child: Card(
              shadowColor: selectedPage == index + selectedPage - 2
                  ? kPrimaryColor
                  : Colors.black,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${index + selectedPage - 2}',
                  style: TextStyle(
                    fontWeight: selectedPage == index + selectedPage - 2
                        ? FontWeight.w900
                        : FontWeight.normal,
                    color: selectedPage == index + selectedPage - 2
                        ? kPrimaryColor
                        : Colors.black,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  List<Widget> paginatorItems() {
    return <Widget>[
      // InkWell(
      //   onTap: () => onItemTapped(-3),
      //   child: Card(
      //     elevation: 3,
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(Icons.first_page, size: 16.0),
      //     ),
      //   ),
      // ),
      InkWell(
        onTap: () => onItemTapped(-1),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.chevron_left, size: 16.0),
          ),
        ),
      ),
      ...paginatorIndices(),
      InkWell(
        onTap: () => onItemTapped(-2),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.chevron_right, size: 16.0),
          ),
        ),
      ),
      // InkWell(
      //   onTap: () => onItemTapped(-4),
      //   child: Card(
      //     elevation: 3,
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(Icons.last_page, size: 16.0),
      //     ),
      //   ),
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: paginatorItems(),
      ),
    );
  }
}
