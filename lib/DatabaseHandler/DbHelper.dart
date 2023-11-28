// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:io' as io;
// import 'package:path/path.dart';
//
// import '../Models/UserModel.dart';
//
// class DbHelper {
//   Database? _db;
//
//   static const String DB_Name = 'test.db';
//   static const int Version = 1;
//
//   static const String Table_User = 'user';
//   static const String C_UserID = 'user_id';
//   static const String C_UserName = 'user_name';
//   static const String C_Email = 'email';
//   static const String C_Password = 'password';
//
//
//   Future<Database> getDb() async {//_getDb kalau di yt jadi _db
//     if (_db != null && _db!.isOpen) {
//       return _db!;
//     }
//     _db = await _initDb();
//     return _db!;
//   }
//
//   Future<Database> _initDb() async {
//     io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, DB_Name);
//     var db = await openDatabase(
//       path,
//       version: Version,
//       onCreate: _onCreate,
//       onConfigure: _onConfigure,
//     );
//     return db;
//   }
//   Future<void> _onConfigure(Database db) async {
//     await db.execute('PRAGMA foreign_keys = ON');
//   }
//
//   Future<void> _onCreate(Database db, int intVersion) async {
//     await db.execute("CREATE TABLE $Table_User ("
//         "$C_UserID TEXT, "
//         "$C_UserName TEXT, "
//         "$C_Email TEXT, "
//         "$C_Password TEXT, "
//         "PRIMARY KEY($C_UserID)"
//         ")");
//   }
//   Future<int> saveData(UserModel user) async{
//     var dbClient = await getDb();
//     var res = await dbClient.insert(Table_User, user.toMap());
//     return res;
//     // user.user_id = (await dbClient.insert(Table_User, user.toMap())) as String;
//     // return user;
//
//   }
//
//   Future<UserModel?> getLoginUser(String userID,String password) async{
//     var dbClient = await getDb();
//     var res = await dbClient.rawQuery("SELECT * FROM $Table_User WHERE "
//     "$C_UserID = '$userID ' AND "
//     "$C_Password = '$password' ");
//
//     if(res.length > 0){
//       return UserModel.fromMap(res.first);
//     }
//     return null;
//
//   }
//
// }
//

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

import '../Models/UserModel.dart';



class DbHelper {
  Database? _db;

  static const String DB_Name = 'test.db';
  static const int Version = 1;

  static const String Table_User = 'user';
  static const String C_UserID = 'user_id';
  static const String C_UserName = 'user_name';
  static const String C_Email = 'email';
  static const String C_Password = 'password';

  Future<Database> getDb() async {
    if (_db != null && _db!.isOpen) {
      return _db!;
    }
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(
      path,
      version: Version,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
    return db;
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        "$C_UserID TEXT, "
        "$C_UserName TEXT, "
        "$C_Email TEXT, "
        "$C_Password TEXT, "
        "PRIMARY KEY($C_UserID)"
        ")");
  }

  Future<int> saveData(UserModel user) async {
    var dbClient = await getDb();
    var res = await dbClient.insert(Table_User, user.toMap());
    return res;
  }

  Future<UserModel?> getLoginUser(String userID, String password) async {
    var dbClient = await getDb();
    var res = await dbClient.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_UserID = '$userID' AND "
        "$C_Password = '$password' ");

    if (res.length > 0) {
      return UserModel.fromMap(res.first);
    }
    return null;
  }
}
