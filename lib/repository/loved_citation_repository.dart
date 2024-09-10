import 'package:loved_cit/model/loved_citation_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class LovedCitationRepository {
  late Database database;

  Future<void> initialize() async {
    final databasePath = await getDatabasesPath();
    final dbPath = path.join(databasePath, 'citation.db');

    database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE loved (id INTEGER PRIMARY KEY, text TEXT NOT NULL)');
      },
    );
  }

  Future<List<LovedCitationModel>> all() async {
    final rows = await database.query("loved");
    return rows.map((row) => LovedCitationModel.fromRecord(row)).toList();
  }

  Future<LovedCitationModel> save(String text, {int id = 0}) async {
    int id = await database.insert('loved', {"text": text});
    return LovedCitationModel(id: id, text: text);
  }

  Future<void> delete(LovedCitationModel lovedCitationModel) async {
    await database
        .delete('loved', where: 'id = ?', whereArgs: [lovedCitationModel.id]);
  }
}
