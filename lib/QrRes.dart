import 'package:flutter/material.dart';
import 'package:hotel_automation/Home.dart';
import 'dart:typed_data';
import 'dart:convert';
class QrRes  extends StatefulWidget {
  final Map data;
  final String scan;
  final Map  resultList;
  final int index;
  final String ip;
  QrRes({Key key, this.scan, this.data, this.resultList, this.index,this.ip}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QrRes();
  }
  
}

class _QrRes extends State<QrRes> {

  String ip;
  @override
  Widget build(BuildContext context) {
     ip = "${widget.ip}";
    
    if("${widget.scan}"=="true"){
      String img= "${widget.resultList["image"]}";
    return Scaffold(appBar: AppBar(
      centerTitle:true,
      title: Text("INFO"),
    ), 
      body:  new ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int i) {
              return new Column(
                children: <Widget>[
                  Card(
                    child:Column(
                      children:<Widget>[
                        Padding(
                          padding:EdgeInsets.only(bottom:8),
                        child:Text("Category: "+"${widget.resultList["category"]}"),
                        ),
                        Image.network("http://$ip:8080/Image?name=$img"),
                        Padding(
                          padding:EdgeInsets.only(top:8),
                          child:Text("${widget.resultList["item_name"]}",textAlign:TextAlign.center,),
                          ),
                        Text("Rs."+"${widget.resultList["price"]}"),
                      ],
                    ),
                  ),
                ],

              );
            })

    
    );
    }
    else{
     String imgs="${widget.data["image"]}";

      /*for(int i=0;i<("${widget.bytes}".length); i++){
        ;
    }*/
        
       //int indexed=int.parse("${widget.index}");
       
       //b.add("${widget.bytes[indexed]}") as Uint8List;
      return Scaffold(appBar: AppBar(
      centerTitle:true,
      title: Text("INFO"),
    ), 
      body:  new ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int i) {
              return new Column(
                children: <Widget>[
                  Card(
                    child:Column(
                      children:<Widget>[
                        Padding(
                          padding:EdgeInsets.only(bottom:8),
                        child:Text("Category: "+"${widget.data["category"]}"),
                        ),
                        Image.network("http://$ip:8080/Image?name=$imgs"),
                        Padding(
                          padding:EdgeInsets.only(top:8),
                          child:Text("${widget.data["item_name"]}",textAlign:TextAlign.center,),
                          ),
                        Text("Rs."+"${widget.data["price"]}"),
                      ],
                    ),
                  ),
                ],

              );
            })
    );

    }
      
    
  }
}