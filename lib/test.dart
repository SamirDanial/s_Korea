import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<String> photos = [
    "https://linguasia.com/wp-content/uploads/Han-Euddeum-1024x682.jpg",
    "https://i.pinimg.com/736x/82/91/f8/8291f819d5bac6e6378f7ba35bccb391.jpg",
    "https://w0.peakpx.com/wallpaper/142/358/HD-wallpaper-korean-girl-beautiful-julie-yang-beautiful-korean-julie-yang-beautiful-korean.jpg",
    "https://i.pinimg.com/564x/cf/3e/f8/cf3ef8dcdd769be84b1282bf111a6586.jpg",
    "https://media.istockphoto.com/id/1257731889/photo/beautiful-young-woman-makeup-stock-photo.jpg?s=612x612&w=0&k=20&c=oCLmCUnLUoNcFOtNUprBwBWa5ue_fk8RBt11jPjp0YU="
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white),
                    Text(
                      "Xiung Msuiee",
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              '323,233',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Icon(Icons.notifications_outlined,
                              color: Colors.white)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height - 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(photos[0], fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
