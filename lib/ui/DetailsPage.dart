import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urunler/data/entity/Urunler.dart';

class DetailsPage extends StatefulWidget {


  Urunler prduct;

  DetailsPage({required this.prduct});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.prduct.name),),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 450,
          child: Card(
            elevation: 8.0,
            color: Colors.deepPurpleAccent,
            margin: const EdgeInsets.all(3.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("images/${widget.prduct.image}"),
                Text('${widget.prduct.price} TL',style: TextStyle(color: Colors.white,fontSize: 30,),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
