import 'package:app1/layout/HomeScreen.dart';
import 'package:flutter/material.dart';
void main() //manger for all app
 {
  runApp(const Myapp()) ;
}
class Myapp extends StatelessWidget
{
  const Myapp({Key key}) : super(key: key);

  @override
  Widget build (BuildContext context) //manager for class
  {
   return MaterialApp(    //needs paramaters
     home:HomeScreen() ,
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       scaffoldBackgroundColor: Colors.cyan[900],
       appBarTheme: AppBarTheme(
         color: Colors.cyan[900]
       ),
     ),
   );
  }

}