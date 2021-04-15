import 'package:QrScanner/pages/home_page.dart';
import 'package:QrScanner/pages/map.dart';
import 'package:QrScanner/pages/map_page.dart';
import 'package:QrScanner/pages/web_page.dart';
import 'package:QrScanner/providers/navigation_bloc.dart';
import 'package:QrScanner/providers/scan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationBloc()),
        ChangeNotifierProvider(create: (_) => ScanProvider())
      ],
      child: MaterialApp(
        title: 'QrScanner',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.lightBlue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (_) => HomePage(),
          '/map-page': (_) => MapPage(),
          '/web': (_) => WebPage(),
          '/map': (_) => MapBody()
        },
      ),
    );
  }
}
