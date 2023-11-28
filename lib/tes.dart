import 'package:sqflite/sqflite.dart';

void testDatabaseConnection() async {
  final databasePath = await getDatabasesPath();
  final databaseFile = '$databasePath/my_database.db'; // Ganti dengan nama dan path file database Anda

  final database = await openDatabase(databaseFile);
  if (database.isOpen) {
    print('Database connection successful!');
  } else {
    print('Database connection failed!');
  }

  await database.close();
}