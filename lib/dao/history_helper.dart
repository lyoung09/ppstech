import 'package:sqflite/sqflite.dart' as sql;
import '../model/user.dart';

class HistoryDao {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        itemName TEXT,
        shopName TEXT,
        image TEXT
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'purchase.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(
      String itemName, String shopName, String image) async {
    final db = await HistoryDao.db();

    final data = {'itemName': itemName, 'shopName': shopName, 'image': image};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<HistoryModel>> getItems() async {
    final db = await HistoryDao.db();
    var historyDatas = await db.query(
      'items',
    );
    List<HistoryModel> histories = historyDatas.toList().isNotEmpty
        ? historyDatas.map((c) => HistoryModel.fromMap(c)).toList()
        : [];

    return histories;
  }
}
