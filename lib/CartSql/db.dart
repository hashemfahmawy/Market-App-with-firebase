import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //
  Database? database;

  Future<void> initDatabase() async {
    //
    database = await openDatabase(
      "cart.db",
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE Cart (id INTEGER PRIMARY KEY, title TEXT, price TEXT,image TEXT , status INTEGER,quantity INTEGER,productId INTEGER ,count INTEGER)');
        log("Database created");
      },
      onOpen: (db) {
        //
        log("Database open");
      },
    );
  }

  Future<void> insertToDatabase({
    String? title,
    String? price,
    String? image,
    String? productId,
    int? status,
  }) async {
    //
    await database!.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO Cart(title, price, image, productId ,status, quantity) VALUES(?, ?, ?,?, ?, ?)',
          [title, price, image, productId, 1, status]).then((vue) {
        //
        log("$vue");
      });
    });
  }

  Future<List<Map>> getAll(int? status) async {
    return await database!
        .rawQuery('SELECT * FROM Cart where status = ?', [status]);
  }

  Future<void> removeFromCart(String productId) async {
    final Database db = await database!;

    // Delete the product from the cart table
    await db.delete(
      'cart',
      where: 'productId = ?',
      whereArgs: [productId],
    );

    print('Product removed from cart successfully!');
  }

  Future<List<Map>> selectCount(String? productId) async {
    return await database!
        .rawQuery('SELECT * FROM Cart where productId = ?', [productId]);
  }

  Future<List<Map>> selectTitle(String? title) async {
    return await database!
        .rawQuery('SELECT * FROM Cart where title = ?', [title]);
  }

  Future<void> updateData({
    int? status,
    int? id,
  }) async {
    //
    await database!.rawUpdate('UPDATE Cart SET status = ?', [status]);
  }

  Future<void> updateQuantity({
    int? quantity,
    String? productId,
  }) async {
    //
    await database!.rawUpdate('UPDATE Cart SET quantity = ? where productId =?',
        [quantity, productId]);
  }

  Future<void> deleteData() async {
    //
    await database!.rawDelete('DELETE FROM Cart ');
  }

  Future<void> delete(String? title) async {
    //
    await database!.rawDelete('DELETE FROM Cart WHERE title = ?', [title]);
  }

  Future<void> deleteId({String? productId}) async {
    //
    await database!
        .rawDelete('DELETE FROM Cart WHERE productId = ?', [productId]);
  }

  Future<int?> getCount() async {
    return Sqflite.firstIntValue(
        await database!.rawQuery('SELECT COUNT(*) FROM Cart'));
  }
}
