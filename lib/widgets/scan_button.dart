import 'package:QrScanner/providers/scan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScanProvider>(context, listen: false);
    return FloatingActionButton(
        child: Icon(Icons.qr_code),
        backgroundColor: Colors.lightBlue,
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              "#ff2255", "Cancel", false, ScanMode.QR);
          //String barcodeScanRes = 'https://youtube.com';
          if (barcodeScanRes == '-1') {
            return;
          }
          provider.newScan(barcodeScanRes);
        });
  }
}
