import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Dbhelper
{
  Database database;

  createdatabase() async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    //data/data/pkgname(com.example.first)/databses
     database = await openDatabase(path,
        version: 2,
        //only call one time at app install
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE register (id INTEGER PRIMARY KEY, name TEXT, email TEXT)');
          await db.execute(
              'CREATE TABLE demo (id INTEGER PRIMARY KEY, name TEXT)');
        },
      //if we change version then call onupgrade
      onUpgrade: (db, oldVersion, newVersion) async {
        print("hello");
        await db.execute(
            'CREATE TABLE fav (id INTEGER PRIMARY KEY, name TEXT)');
      },);
  }

  insertdata(String name,String email) async
  {

      int id1 = await database.rawInsert(
          "INSERT INTO register(id, name, email) VALUES(null,'$name','$email')");
      print('inserted1: $id1');
  }

  Future<List> getdata() async
  {

    List list=await database.rawQuery("select * from register");
    print(list);
        return list;
  }






  }