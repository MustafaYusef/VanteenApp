import 'package:flutter/material.dart';

import 'ServicesScreen.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => new _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: new IconThemeData(color:  Color(0xffA62B84)),
        centerTitle: true,
        title: Directionality(
          child: Text("الحجوزات",style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 22),),
          textDirection: TextDirection.rtl,
          
        ),
      ),
      body: Container(
       
        child: Column(
          children: <Widget>[
               rowBody("السبت"),
                rowBody("الأحد"),
                 rowBody("الأثنين"),
                  rowBody("الثلاثاء"),
                  rowBody("الأربعاء"),
                  rowBody("الخميس"),
                  SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width-50,
                  height: 100,
                  child: Image.asset("assets/images/Asset.png"),
                ),
          ],
        ),
      ),
    );
  }
}

class rowBody extends StatelessWidget {
  String title;
   rowBody(
    this.title
    
  );

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.only(
             top: 10, bottom: 5, left: 10, right: 10),
           decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           color: Color(0xffF292D7) 
         ),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
              ),
              width: 100,
              height: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  elevation: 5,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text("أحجز الأن",
                        style:
                            TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  onPressed: () {
                     Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                    return ServicesScreen(title);
                                  }));
                  },
                ),
              ),
            ),
       Container(
        padding: EdgeInsets.all(5),
         child: Directionality(textDirection: TextDirection.rtl,
         child:Text(title,style: TextStyle(color: Colors.white,
         fontSize: 18),),),
       ),
              
      ],
    ),);
  }
}
