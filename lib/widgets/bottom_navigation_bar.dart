import 'package:QrScanner/providers/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationBloc>(context);

    return BottomNavigationBar(
      elevation: 0.0,
      onTap: (int i) => provider.changeCurrentIndex = i,
      currentIndex: provider.currentIndex,
      items: [
        BottomNavigationBarItem(label: 'Geo', icon: Icon(Icons.gps_fixed)),
        BottomNavigationBarItem(label: 'Web', icon: Icon(Icons.web))
      ],
    );
  }
}
