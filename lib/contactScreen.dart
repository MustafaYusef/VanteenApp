import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class contactScreen extends StatefulWidget {
  @override
  _contactScreenState createState() => new _contactScreenState();
}

class _contactScreenState extends State<contactScreen> {
  _launchURL() async {
  const url = 'https://www.facebook.com/majillanosoft/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: new IconThemeData(color: Theme.of(context).primaryColor),
        title: Directionality(
          child: Text(
            "تواصل معنا",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          textDirection: TextDirection.rtl,
        ),
        centerTitle: true,
      ),
      body: new Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () async {
                await FlutterOpenWhatsapp.sendSingleMessage(
                    "+964" + "7722609065", "");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Directionality(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                      width: 40,
                                      height: 40,
                                      margin: EdgeInsets.only(left: 5),
                                      child: Image.asset(
                                          "assets/images/whatsapp.png")),
                                ),
                                Text(
                                  "07722609065",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ],
                            ),
                            textDirection: TextDirection.rtl,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                var url = 'https://www.instagram.com/vanteenclinic/';

                if (await canLaunch(url)) {
                  await launch(
                    url,
                    universalLinksOnly: true,
                  );
                } else {
                  throw 'There was a problem to open the url: $url';
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Directionality(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                      width: 40,
                                      height: 40,
                                      margin: EdgeInsets.only(left: 5),
                                      child: Image.asset(
                                          "assets/images/instagram.png")),
                                ),
                                Text(
                                  "@vanteenclinc",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ],
                            ),
                            textDirection: TextDirection.rtl,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                final Uri _emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'vanteenclinic@gmail.com',
                );

// ...

// mailto:smith@example.com?subject=Example+Subject+%26+Symbols+are+allowed%21
                launch(_emailLaunchUri.toString());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Directionality(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                      width: 40,
                                      height: 40,
                                      margin: EdgeInsets.only(left: 5),
                                      child: Image.asset(
                                          "assets/images/gmail.png")),
                                ),
                                Text(
                                  "vanteenclinic@gmail.com",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ],
                            ),
                            textDirection: TextDirection.rtl,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                await MapsLauncher.launchCoordinates(33.301379, 44.343420);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Directionality(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                      width: 40,
                                      height: 40,
                                      margin: EdgeInsets.only(left: 5),
                                      child: Image.asset(
                                          "assets/images/gps.png")),
                                ),
                                Container(
                                  child: Expanded(
                                    child: Text(
                                      "موقع المركز على الخريطة",
                                      // "الموقع : موقع المركز اليرموك الاربع شوارع شارع مدور النادي السرابهی مدور محشر الأوائنل مقابل صميدالية زهرة اليرموك-الطابق الاول",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[900],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            textDirection: TextDirection.rtl,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Directionality(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(left: 5),
                                    child: Image.asset(
                                        "assets/images/location.png")),
                              ),
                              Container(
                                child: Expanded(
                                  child: Text(
                                    """الموقع: اليرموك الاربع شوارع شارع مجاور النادي الترفيهي مجاور مختبر الأوائل مقابل صيدلية زهرة اليرموك-الطابق الاول""",
                                    // "الموقع : موقع المركز اليرموك الاربع شوارع شارع مدور النادي السرابهی مدور محشر الأوائنل مقابل صميدالية زهرة اليرموك-الطابق الاول",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[900],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          textDirection: TextDirection.rtl,
                        )),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                                          child: Directionality(
                        child: InkWell(
                          onTap: (){
                            _launchURL();
                          },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Text(

                            "Majillanosoft.dev.com",
                            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[900],
                            ),
                          ),
                                ),
                        ),
                        textDirection: TextDirection.rtl,
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
