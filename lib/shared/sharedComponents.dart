import 'package:sqflite/sqflite.dart';
import 'package:app1/layout/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
Widget defultButton({
   double width=double.infinity,
  Color background=Colors.teal,
  @required Function function,
  @required String text,
})=>Container(
  width:width ,
  color:background,
  child: MaterialButton(
    onPressed:function,
    child: Text(text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);
void navigateTo (context , widget)=>Navigator.push(
    context,/*current widget*/
    /*widget : the next widget */
   MaterialPageRoute(builder :(context)=>widget) );
void navigateAndFinish(context ,widget)=>Navigator.pushAndRemoveUntil
  (context,
    MaterialPageRoute(builder:(context)=>widget ),
        (route) => false);
Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required Function validate,
  @required String label,
  @required IconData prefix,
})=>TextFormField(
controller:controller ,
  keyboardType: type,
//validator: validate,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix
    ),
  ),
);

Database database;
void createDB() async{
  database = await openDatabase('Bank.db',
      version: 1,
      onCreate: (database, int version) async {
        print('database created');
        await database.execute(
            'CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT, email TEXT, Rs REAL,phone TEXT)')
            .then((value) {
          print('user created');
        }
        ).catchError((error) {
          print('error when user table created ${error.toString()}');
        });
      },
      onOpen: (database) {
        getfromDB(database).then((value) {
          print('data base opened');
        });

      }
  );
}
Future<int> insertonDB() async
{
  await database.transaction((txn) async {
    int id1 = await txn.rawInsert(

        'INSERT INTO user(name,email, Rs,phone) VALUES("Hassan","hassan@gmail.com", 5000,"01020798917")');

    print('inserted1: $id1');

    int id2 = await txn.rawInsert(

        'INSERT INTO user(name,email,Rs,phone) VALUES("Nourhan","nourhan@gmail.com",9000,"0102079228")');

    print('inserted2: $id2');

    int id3 = await txn.rawInsert(

        'INSERT INTO user(name,email,phone, Rs) VALUES("Moaz","moaz@gmail.com","01092930059", 4000)');

    print('inserted3: $id3');

    int id4 = await txn.rawInsert(

        'INSERT INTO user(name,email,phone, Rs) VALUES("Mansour","mansour@gmail.com", "0102669228", 7000)');

    print('inserted4: $id4');

    int id5 = await txn.rawInsert(

        'INSERT INTO user(name,email, phone, Rs) VALUES("nour","nour@gmail.com","01092888559", 4000)');

    print('inserted5: $id5');

    int id6 = await txn.rawInsert(

        'INSERT INTO user(name,email,phone, Rs) VALUES("Mahrous","mahrous@gmail.com","0112559228", 7000)');

    print('inserted6: $id6');

    int id7 = await txn.rawInsert(

        'INSERT INTO user(name,email,phone, Rs) VALUES("yassmin","yassmin@gmail.com","01444293059", 3000)');

    print('inserted7: $id7');

    int id8 = await txn.rawInsert(

        'INSERT INTO user(name,email,phone, Rs) VALUES("Ali ","ali@gmail.com","0102779228", 8000)');

    print('inserted8: $id8');

    int id9 = await txn.rawInsert(

        'INSERT INTO user(name,email,phone, Rs) VALUES("Mohamed","mohammed@gmail.com","01044430059", 4000)');

    print('inserted9: $id9');

    int id10 = await txn.rawInsert(

        'INSERT INTO user(name,email,phone, Rs) VALUES("Shehab ","shehab@gmail.com","01148622228", 7000)');

    print('inserted10: $id10');
  });
}
Future<List<Map>> getfromDB(database)async
{
  list = await database.rawQuery('SELECT * FROM user');

}
/*void UpdateDB(
  @required double Rs,
  @required int id,
)async
{
   await database.rawUpdate(
      'UPDATE user SET Rs = ? WHERE id = ? ',
      [Rs, id]).then((value) {
        print('Data has neen Updated');
   });
}*/