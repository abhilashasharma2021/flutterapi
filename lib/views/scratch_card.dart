import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class ScratchCard extends StatefulWidget {
  @override
  _ScratchCardState createState() => _ScratchCardState();
}

class _ScratchCardState extends State<ScratchCard> {
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scratch Card In Flutter",
          style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            minimumSize: Size(50, 50),
            elevation: 5,
          ),
          child: const Text("Scratch Card",
            style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),),
          onPressed: (){
            scratchDialog(context);
          },

        ),
      ),
    );
  }

  Future<void> scratchDialog(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            title: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("You Earned Gift",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return Scratcher(
                color: Colors.cyan,
                accuracy: ScratchAccuracy.low,
                threshold: 30,
                brushSize: 40,
                onThreshold: () {
                  setState(() {
                    _opacity = 1;
                  });
                },
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: _opacity,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Column(
                      children: [
                        Text("Hurray! you won",style: TextStyle(fontSize: 20),),
                        Expanded(child: Image.asset("assets/scratch.jpg",))
                      ],
                    ),
                  ),
                ),

              );
            }),
          );
        }
    );
  }
}