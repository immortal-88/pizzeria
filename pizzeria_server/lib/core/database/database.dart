import 'package:mongo_dart/mongo_dart.dart';
import 'package:pizzeria_server/core/constants/db_constants.dart';

/// Database client class to connect to the database
class DatabaseClient {
  DatabaseClient._();

  static final DatabaseClient _instance = DatabaseClient._();

  /// Singleton instance of the database client
  static DatabaseClient get instance => _instance;

  Db? _db;

  /// Connect to the database
  Future<void> connect() async {
    if (_db != null) {
      return;
    }
    final db = await Db.create(DBConstants.uriString);
    await db.open();
    _db = db;
  }

  /// Db getter
  Db? get db => _db;
}
