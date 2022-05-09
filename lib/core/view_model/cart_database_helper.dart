// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import '../../../constance.dart';
// import '../../../model/cart_activity_model.dart';
//
// class CartDataBaseHelper {
//   CartDataBaseHelper._();
//
//   static final CartDataBaseHelper db = CartDataBaseHelper._();
//  late  Database _database;
//
//   Future<Database> get database async {
//     if(_database!=null)return _database;
//      _database = await initDB();
//     return _database;
//   }
//
//
//   initDB() async {
//     print('data base insert');
//
//   String path = join(await getDatabasesPath(), 'CartActivity.db');
//     return await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute('''
//       CREATE TABLE $tabelCartActivity(
//       $columnName TEXT NOT NULL,
//       $columnImage TEXT NOT NULL,
//       $columnPrice TEXT NOT NULL,
//       $columnDateAndTime TEXT NOT NULL)
//       ''');
//     }
//     );
//   }
//  Future<List<CartActivityModel>>getAllActivity()async
//   {
//     var dbClient = await database;
//     List<Map> maps=await dbClient.query(tabelCartActivity);
//     List<CartActivityModel> list=maps.isNotEmpty?
//         maps.map((e) => CartActivityModel.fromJson(e)).toList():[];
//     return list;
//   }
//   insert(CartActivityModel model) async {
//     var dbClient = await database;
//     await dbClient.insert(tabelCartActivity, model.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }
// }
