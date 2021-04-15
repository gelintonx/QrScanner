import 'package:QrScanner/providers/scan_provider.dart';
import 'package:QrScanner/widgets/scan_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WebPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScanProvider>(context);
    final scans = provider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, int index) {
        final scan = scans[index];
        return ScanTile(scan: scan, type: 'http');
      },
    );
  }
}
