import 'package:pas1_mobile_11pplg1_34/models/Local%20Databases/FavoriteTeam_models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'teams_favorite.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(idTeam TEXT, strTeam TEXT, strBadge TEXT, strDescriptionEN TEXT)',
        );
      },
    );
  }

  Future<void> insertFavorite(FavoriteteamModels team) async {
    final db = await database;
    await db.insert(
      'favorites',
      team.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<FavoriteteamModels>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');

    return List.generate(maps.length, (i) {
      return FavoriteteamModels.fromMap(maps[i]);
    });
  }

  Future<void> deleteFavorite(int id) async {
    final db = await database;
    await db.delete(
      'favorites',
      where: 'idTeam = ?',
      whereArgs: [id],
    );
  }
}
