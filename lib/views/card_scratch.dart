import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

class CardScratch extends StatefulWidget {
  const CardScratch({Key? key}) : super(key: key);

  @override
  State<CardScratch> createState() => _CardScratchState();
}

class _CardScratchState extends State<CardScratch> {
  late ConfettiController _confettiController;
  Random random = Random();
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  declareWinner() {
    setState(() {
      _opacity = 1;
      _confettiController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAAE4F),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFBF1B1B),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Scratch\n",
                            style: GoogleFonts.kalam(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: "TO WIN\n",
                            style: GoogleFonts.bungeeShade(
                              textStyle: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: "Prizes up to\n",
                            style: GoogleFonts.kalam(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: "\$100,000",
                            style: GoogleFonts.kalam(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Scratcher(
                        brushSize: 70,
                        threshold: 30,
                        accuracy: ScratchAccuracy.high,
                        image: Image.asset(
                          'assets/scratch.jpg',
                          fit: BoxFit.fill,
                        ),
                        onThreshold: () => declareWinner(),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.55,
                          alignment: Alignment.center,
                          color: Colors.grey.shade300,
                          child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(10),
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisExtent:
                                  (MediaQuery.of(context).size.height *
                                      0.55) /
                                      3),
                              itemCount: 9,
                              itemBuilder: (BuildContext context, int index) {
                                return Center(
                                    child: Text(
                                      '\$${random.nextInt(100)}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ));
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 220),
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _opacity,
                child: Text(
                  "You Won!",
                  style: GoogleFonts.lilitaOne(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: -pi / 3,
              emissionFrequency: 0.01,
              numberOfParticles: 10,
              maximumSize: const Size(20, 10),
              maxBlastForce: 40,
              minBlastForce: 30,
              gravity: 0.1,
              shouldLoop: true,
            ),
          )
        ],
      ),
    );
  }
}

