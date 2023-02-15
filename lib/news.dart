import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

import 'detail.dart';

 class NEWS extends StatefulWidget {
  const NEWS({super.key});

  @override
  State<NEWS> createState() => _NEWSState();
}

class _NEWSState extends State<NEWS> {
   var data;
   
  @override
   void initState() {
    // TODO: implement initState
    super.initState();
     fetchdata();
  }
   fetchdata() async{
     var url=Uri.parse("https://api.sampleapis.com/futurama/characters");
     var res= await  http.get(url);
      // print(res.body);
      data=jsonDecode(res.body);
       
      //  print(data[0]["name"]["first"]);
      //  print(data[0]["sayings"]);
      //   var say=jsonDecode(res.body)["sayings"];
      //  print(say);
       setState(() {
          
       });
     
     
     

   }
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("News App"),),
        // backgroundColor: Vx.teal300,
         body: data!=null?
        //  Container()
         ListView.builder(
           itemCount: data.length,
          itemBuilder: (context,index){
             String  str=data[index]["occupation"];
             return  InkWell(
               onTap: () {
                 Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>Detail( title: data[index]["occupation"],disc:data[index]["sayings"],image: data[index]["images"]["main"] ,)));
               },
               child: Column(
                children: [
                  // Text(data[index]["name"]["first"]),
                  //   Text(data[index]["name"]["last"]),
                     ListTile(
                      leading: CircleAvatar(
                         backgroundColor: Vx.gray900,
                        
                        child: Image.network(data[index]["images"]["main"])),
                       title: Column(
             
                         crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                         Text(data[index]["occupation"],style: TextStyle(fontWeight: FontWeight.bold),)
                       ],),
                        
                        subtitle: Text(data[index]["sayings"].toString(),overflow:TextOverflow.ellipsis,),
                     )
                ],
               ),
             );
          })
          :Center(child: CircularProgressIndicator(),)
    );
  }
}