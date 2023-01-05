import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class ScratchAndConfettiAnimation extends StatefulWidget {
  const ScratchAndConfettiAnimation({Key? key}) : super(key: key);

  @override
  State<ScratchAndConfettiAnimation> createState() => _ScratchAndConfettiAnimationState();
}

class _ScratchAndConfettiAnimationState extends State<ScratchAndConfettiAnimation> {
  late ConfettiController _controller;


  @override
  void initState() {
    super.initState();
    _controller=new ConfettiController(
      duration: new Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Scratcher(brushSize: 70,
          threshold: 70,
          image: Image.asset("assets/images.png",
            fit: BoxFit.fill,
          ),
          onChange: (value)=>print("Scratch Progress:$value"),
          onThreshold: ()=>_controller.play(),
          child: Container(
            height: 300,
            width: 300,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment:  CrossAxisAlignment.center,
              children: [
                Image.asset("assets/scratch.jpg",
                fit: BoxFit.contain,
                width: 150,
                height: 150,
                ),
                Column(
                  children: [
                 ConfettiWidget(
                     confettiController: _controller,
                 blastDirectionality: BlastDirectionality.explosive,
                 particleDrag: 0.05,
                 emissionFrequency: 0.05,
                 numberOfParticles: 50,
                 gravity: 0.05,
                 shouldLoop: false,
                 colors: [
                   Colors.green,
                   Colors.red,
                   Colors.yellow,
                   Colors.blue ,
                   Colors.grey ,
                 ],
                 ),
                    Text("You Won",
                      style: TextStyle(
                          fontWeight:FontWeight.w400,
                      fontSize: 25,
                      ),
                    ),
                    Text(" 1 Lakh",
                      style: TextStyle(
                        fontWeight:FontWeight.w400,
                        fontSize: 25,
                      ),
                    ),
                ],

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
