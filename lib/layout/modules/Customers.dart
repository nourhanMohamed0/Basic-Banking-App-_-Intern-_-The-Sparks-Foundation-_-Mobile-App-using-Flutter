import 'package:app1/shared/sharedComponents.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/constants.dart';
import 'info.dart';
class Customers extends StatefulWidget {
  @override
  State<Customers> createState() => _CustomersState();
}


class _CustomersState extends State<Customers> {
  // List<String> users=['Hassan','Nourhan','Moaz','Mansour','nour','Mahrous','yassmin','Ali','Mohamed','Shehab'];
  int id2;
  double z;
  var CustomerController=TextEditingController();
  var ScaffoldKey =GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: ScaffoldKey,
        appBar: AppBar(
          leading:
          Icon(
            Icons.person,
          ),
          title: Text('Customers'),
        ),
        body : SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                  controller: CustomerController,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (String value){
                    setState(() {
                      print(value);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Customer',
                    suffixIcon: Icon(Icons.search),
                    border:OutlineInputBorder(),
                  )
              ) ,
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder:(context,index)=>ItemBuilder(context,list,index),
                  separatorBuilder:(context,index)=>SizedBox(height: 0.0),
                  itemCount:10) ,


            ],

          ),
        )

    );

  }
  Widget ItemBuilder(context,List l,int index)=>
      Padding(
        padding: const EdgeInsets.all(7.5),
        child: Column(
          children: [
            InkWell(
              onTap:(){
                setState(() {
                  id2=index;
                  navigateTo(context
                      ,information(id2,index, list));
                  print(l[id2]['Rs']);
                  print(id2);
                  z= l[index]['Rs'];
                });

              } ,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      children:[
                        Text(list[index]['name'].toString() ,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Spacer(),
                        Text(list[index]['Rs'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,)),
                      ]

                  ),
                ),
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
          ],
        ),
      );
}
