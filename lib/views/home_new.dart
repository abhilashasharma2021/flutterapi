import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class HomeNew extends StatefulWidget {
  const HomeNew({Key? key}) : super(key: key);

  @override
  State<HomeNew> createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> {
  int currentPos = 0;
  List<String> listPaths = [
    "assets/nature1.jpg",
    "assets/nature2.jpg",
    "assets/nature3.jpg",
    "assets/nature4.jpg",
    "assets/nature5.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.fromLTRB(15,40,15,0),
          child: Column(

              children: [
            CarouselSlider.builder(
                  itemCount: listPaths.length,
                  options: CarouselOptions(
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPos = index;
                        });
                      }
                  ),
                itemBuilder: (context,int index,_){
                    return MyImageView(listPaths[index]);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listPaths.map((url) {
                    int index = listPaths.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPos == index
                            ? Color.fromRGBO(0, 0, 0, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
              ]
          )
      ),
    );
  }
}

class MyImageView extends StatelessWidget{

  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(imgPath),
        )
    );
  }

}