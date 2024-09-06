import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_barbeiro/aula/banco/script.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() {
  setUpAll(() {
    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();
  });

  test('teste script', () async {
    var db2 = await openDatabase(inMemoryDatabasePath);
    deleteDatabase(db2.path);

    var db = await openDatabase(
      inMemoryDatabasePath,
      version: 1,
      onCreate: (db, version) {
      criarTabelas.forEach(db.execute);
      inserirRegistros.forEach(db.execute);
    });
    var list = await db.rawQuery('SELECT * FROM professor');
    expect(list.length, 3);

    // for (var tabela in criarTabelas) {
    //   db.execute(tabela);
    // }

    // criarTabelas.forEach((tabela) => db.execute(tabela));
  });
}
