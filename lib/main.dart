import 'package:flutter/material.dart';



import 'BookingScreen.dart';
import 'ServicesScreen.dart';
import 'contactScreen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Regular", primaryColor: Color(0xffA62B84),
        ),
      home: MainScreen()));
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      //   appBar: AppBar(
      //     centerTitle: true,
      //       title: Directionality(child: Text("vatrina"),
      //       textDirection: TextDirection.rtl,

      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Image.asset("assets/images/vatrinRose.png",
                  height: MediaQuery.of(context).size.height/2,),
                  bottom: -10,left: 0,),
Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ClipPath(
                              clipper: BottomWaveClipper(),
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/mainpic.jpg"),
                              ),
                            ),
                            ClipPath(
                              clipper: BottomWaveClipper(),
                              child: Container(
                                color:
                                    Theme.of(context).primaryColor.withOpacity(0.2),
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                              ),
                            )
                          ],
                        )),
                    Container(
                      width: 125,
                      height: 100,
                      child: Image.asset("assets/images/Asset.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10, left: 40, right: 40),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            elevation: 5,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text("الحجوزات",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 20)),
                            ),
                            onPressed: () {
                                    Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return BookingScreen();
                                      }));
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10, left: 40, right: 40),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            elevation: 5,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text("الخدمات",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 20)),
                            ),
                            onPressed: () {
                                 Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return ServicesScreen();
                                      }));
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10, left: 40, right: 40),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            elevation: 5,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text("التواصل",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 20)),
                            ),
                            onPressed: () {
                                 Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return contactScreen();
                                      }));
                              
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                  //  Image.asset("assets/images/vatrinImage.png")
                ),
              ),
              ],
                         
            ),
          ),
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
