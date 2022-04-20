import 'package:app1/layout/HomeScreen.dart';
import 'package:app1/shared/Cubit/States.dart';
import 'package:app1/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:app1/shared/sharedComponents.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app1/shared/Cubit/cubit.dart';
class transferTO extends StatelessWidget {
  double RS;
  int id1;
  transferTO({
    @required this.RS,
    @required this.id1
  });
  int id2;

  var CustomerController=TextEditingController();

  int id11;

  var ScaffoldKey =GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context ,state){},
        builder: (context,state)
        {
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
                          print(value);
                        }
                        ,
                        decoration: InputDecoration(
                          hintText: 'Search Customer',
                          suffixIcon: Icon(Icons.search),
                          border:OutlineInputBorder(),
                        )
                    ) ,
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder:(context,index) =>ItemBuilder(context,list,index),
                        separatorBuilder:(context,index)=>SizedBox(height: 0.0),
                        itemCount:10) ,


                  ],

                ),
              )

          );
        },
      ),
    );
  }

  Widget ItemBuilder(context,List l,int index)=>Padding(
    padding: const EdgeInsets.all(7.5),
    child: Column(
      children: [
        InkWell(
          onTap:(){

              id2=index;
            //  print(id1);
              print(id2);
              double inc=RS+l[id2]['Rs'];
              double dec=l[id1]['Rs']-RS;
              print(id1);
              AppCubit.get(context).UpdateDB(dec, l[id1]['id']);
              AppCubit.get(context).UpdateDB(inc, l[id2]['id']);
           //   transtable(sender: l[id1]['name'], receiver: l[id2]['name'], RS: RS);
              trans= {'Sender':l[id1]['name'],
                'Receiver':l[id2]['name'],
                'RS':RS.toString()
              };
               navigateAndFinish(context, HomeScreen());

                                  //////////////////////////////
           // print(l[id]['Rs']);
            Fluttertoast.showToast(
                msg: "Money has been transferred Succefully!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 4,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0
            );
          } ,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                //val==l[index]['name'] ? 'not found':l[index]['name']).toString(),
                  children:[
                    Text(l[index]['name'] ,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Spacer(),
                    Text(
                        l[index]['Rs'].toString(),style: TextStyle(
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
