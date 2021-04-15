import 'dart:io';

import 'package:QrScanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBProvider {
  // Aply Singleton pattern to the DB instance

  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory dbPath = await getApplicationDocumentsDirectory();
    final path = join(dbPath.path, 'ScanDB.db');
    print(path);
    // Create DB

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      print('DB created!!');
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          type VARCHAR,
          value VARCHAR 
        ) 
        ''');
    });
  }

  Future<int> createScan(ScanModel scan) async {
    final db = await database;
    final response = await db.insert('Scans', scan.toJson());
    return response;
  }

  Future getAllScans() async {
    final db = await database;
    final response = await db.query('Scans');
    return response.isNotEmpty
        ? response.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future getScanById(int id) async {
    final db = await database;
    final response = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return response.isNotEmpty ? ScanModel.fromJson(response.first) : null;
  }

  Future<List<ScanModel>> getScanByType(String type) async {
    final db = await database;
    final response =
        await db.query('Scans', where: 'type = ?', whereArgs: [type]);
    return response.isNotEmpty
        ? response.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<int> updateScan(ScanModel scan) async {
    final db = await database;
    final response = await db
        .update('Scans', scan.toJson(), where: 'id=?', whereArgs: [scan.id]);
    return response;
  }

  Future<int> deleteAll() async {
    final db = await database;
    final response = await db.delete('Scans');
    return response;
  }

  Future<int> deleteScanById(int id) async {
    final db = await database;
    final response = await db.delete('Scans', where: 'id=?', whereArgs: [id]);
    return response;
  }
}
