import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  late Database _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    // if (_database != null) {
    //   return _database;
    // }

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, 'my_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''CREATE TABLE personal_detail(
                id INTEGER PRIMARY KEY,
                fullName TEXT,
                email INTEGER,
                profession TEXT,
                phoneNumber TEXT,
                country TEXT,
                city TEXT
              )''',
        );

        await db.execute(
          '''CREATE TABLE experience(
                id INTEGER PRIMARY KEY,
                job_title TEXT,
                organization_name TEXT,
                description TEXT,
              )''',
        );

        await db.execute(
          '''CREATE TABLE others(
                id INTEGER PRIMARY KEY,
                skill TEXT,
                education TEXT,
                additionalInfo TEXT,
                
              )''',
        );

        await db.execute(
          '''CREATE TABLE project(
                id INTEGER PRIMARY KEY,
                projectTitle TEXT,
                description TEXT
              )''',
        );

        await db.execute(
          '''CREATE TABLE login(
                id INTEGER PRIMARY KEY,
                username TEXT,
                password TEXT
              )''',
        );

        await db.execute(
          '''CREATE TABLE register(
                id INTEGER PRIMARY KEY,
                username TEXT,
                email TEXT,
                password TEXT
              )''',
        );
      },
    );
  }
// ************************** login ********************
  Future<int> insertLogin(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('login', row);
  }

  Future<List<UserModelLogin>> queryAllLogin() async {
    final db = await database;
    final result =  await db.query('login');
    return result.map((row) => UserModelLogin.fromMap(row)).toList();
  }

  Future<int> updateLogin(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db
        .update('login', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteLogin(int id) async {
    Database db = await instance.database;
    return await db.delete('login', where: 'id = ?', whereArgs: [id]);
  }
// ************************** register ********************

  Future<int> insertRegister(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('register', row);
  }

  Future<List<UserModelRegister>> queryAllregister() async {
    final db = await database;
    final result =  await db.query('register');
    return result.map((row) => UserModelRegister.fromMap(row)).toList();
  }

  Future<int> updateRegister(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db
        .update('register', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteRegister(int id) async {
    Database db = await instance.database;
    return await db.delete('register', where: 'id = ?', whereArgs: [id]);
  }

  // ************************** personal detail ********************

  Future<int> insertPersonalDetail(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('personal_detail', row);
  }

  Future<List<UserModelPersonalDetail>> queryAllpersonalDetail() async {
    final db = await database;
    final result =  await db.query('personal_detail');
    return result.map((row) => UserModelPersonalDetail.fromMap(row)).toList();
  }

  Future<int> updatePersonalDetail(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db
        .update('personal_detail', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deletePersonalDetail(int id) async {
    Database db = await instance.database;
    return await db.delete('personal_detail', where: 'id = ?', whereArgs: [id]);
  }

// ************************** experience ********************

  Future<int> insertExperience(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('experience', row);
  }

  Future<List<Map<String, dynamic>>> queryAllExperience() async {
    Database db = await instance.database;
    return await db.query('experience');
  }

  Future<int> updateExperience(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db.update('experience', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteExperience(int id) async {
    Database db = await instance.database;
    return await db.delete('experience', where: 'id = ?', whereArgs: [id]);
  }
  

  // ************************** others ********************

  Future<int> insertOthers(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('others', row);
  }

  Future<List<Map<String, dynamic>>> queryAllOthers() async {
    Database db = await instance.database;
    return await db.query('others');
  }

  Future<int> updateOthers(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db.update('others', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteOthers(int id) async {
    Database db = await instance.database;
    return await db.delete('others', where: 'id = ?', whereArgs: [id]);
  }

  // ************************** project ********************
  Future<int> insertProject(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('project', row);
  }

  Future<List<Map<String, dynamic>>> queryAllProject() async {
    Database db = await instance.database;
    return await db.query('project');
  }

  Future<int> updateProject(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row['id'];
    return await db.update('project', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteProject(int id) async {
    Database db = await instance.database;
    return await db.delete('project', where: 'id = ?', whereArgs: [id]);
  }
}

final DatabaseHelper instance = DatabaseHelper();
