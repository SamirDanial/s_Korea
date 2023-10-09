import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Location',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
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
                        Icon(Icons.notifications_outlined, color: Colors.white)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height - 200,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: PageView.builder(
                      itemCount: photos.length,
                      controller: PageController(initialPage: 0),
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.network(
                              photos[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: DotsIndicator(
                      dotsCount: photos.length,
                      position: _currentIndex,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.pink,
                        size: const Size(20.0, 4.0),
                        activeSize: const Size(100.0, 4.0),
                        spacing: const EdgeInsets.all(4.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
