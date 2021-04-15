import 'package:QrScanner/pages/map_page.dart';
import 'package:QrScanner/pages/web_page.dart';
import 'package:QrScanner/providers/navigation_bloc.dart';
import 'package:QrScanner/providers/scan_provider.dart';
import 'package:QrScanner/widgets/bottom_navigation_bar.dart';
import 'package:QrScanner/widgets/scan_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScanProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('QRScanner'),
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                provider.deleteAll();
              })
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigation(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationBloc>(context);
    final provider = Provider.of<ScanProvider>(context, listen: false);

    switch (navigationProvider.currentIndex) {
      case 0:
        provider.getScansByType('geo');
        return MapPage();
      case 1:
        provider.getScansByType('http');
        return WebPage();
      default:
        return MapPage();
    }
  }
}
