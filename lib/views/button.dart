
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool buttonenabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enable/Disable Buttons"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: (){},
                child:  Text("Elevated Button One")),
            OutlinedButton(
                onPressed: buttonenabled?(){ //if buttonenabled == true then pass a function otherwise pass "null"
                  print("Outline Button Two Pressed");
                }:null,
                child: Text("Outline Button Two")
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() { //setState to refresh UI
                    if(buttonenabled){
                      buttonenabled = false;
                      //if buttonenabled == true, then make buttonenabled = false
                    }else{
                      buttonenabled = true;
                      //if buttonenabled == false, then make buttonenabled = true
                    }
                  });

                },
                child: Text("Toggle Buttons")
            )
          ],
        ),
      ),


    );
  }
}
