import 'package:app1/shared/constants.dart';
import 'package:flutter/material.dart';
class transtable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.compare_arrows
        ),
        title: Text(
          'Transfer Table'
        ),
      ),
      body:ListView.separated(
          itemBuilder: (context,index)=>Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          trans['Sender'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Icon(
                            Icons.trending_flat_outlined
                        ),
                        Text(trans['Receiver'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ), ),
                        Spacer(),
                        Text(trans['RS'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ), ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          separatorBuilder:(context,index)=>SizedBox(height: 0.0) ,
          itemCount: 1)
    );
  }
  /*Widget transBuilder(context,Map m)=>Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                    m['Sender'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Icon(
                    Icons.trending_flat_outlined
                ),
                Text(m['Receiver'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ), ),
                Spacer(),
                Text(m['RS'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ), ),
              ],
            ),
          ),
        )
      ],
    ),
  );*/
}
