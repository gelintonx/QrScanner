import 'package:QrScanner/models/scan_model.dart';
import 'package:QrScanner/providers/db_provider.dart';
import 'package:flutter/material.dart';

class ScanProvider extends ChangeNotifier {
  List<ScanModel> _scans = [];
  String _defaultType = 'http';

  get scans {
    return _scans;
  }

  newScan(String barcode) async {
    final scan = ScanModel(value: barcode);
    final id = await DBProvider.db.createScan(scan);
    scan.id = id;

    if (this._defaultType == scan.type) {
      _scans.add(scan);
      notifyListeners();
    }

    return scan;
  }

  getScans() async {
    final scans = await DBProvider.db.getAllScans();
    this._scans = scans;
    notifyListeners();
  }

  getScansByType(String type) async {
    final scans = await DBProvider.db.getScanByType(type);
    this._scans = [];
    this._scans = [...scans];
    this._defaultType = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAll();
    this._scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScanById(id);
  }
}
