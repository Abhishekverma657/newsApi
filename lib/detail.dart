import 'dart:ffi';

import 'package:flutter/material.dart';
 import 'news.dart';
 class Detail extends StatelessWidget {
  String  title;
   String image;
  List disc=[];
   Detail({super.key, required this.title,required this.disc,required this.image});

  @override
  Widget build(BuildContext context) {
     
    return  Scaffold(
       
       appBar: AppBar(title: Text(title)),
       
       
        body:  Column(
          children: [
             
              Flexible(
                 fit: FlexFit.loose, 
                  flex: 1,
                child: Image.network(image,)),
                 Divider(height: 30,color: Colors.redAccent,),
             
            Flexible(
              flex: 2,
              child: ListView.builder(
                 
                 itemCount: disc.length,
                itemBuilder: ((context, index ) {
                  return Column( 
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      // Text(index.toString()),
                       
                          Text(  {index+1}.toString()+"."+"  "+ disc[index])
                     ],
                  );
                })),
            ),
          ],
        )

    );
  }
}