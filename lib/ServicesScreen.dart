import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

import 'BookingScreen.dart';
import 'alert.dart';

class ServicesScreen extends StatefulWidget {
  String day = null;
  ServicesScreen([this.day]);

  @override
  _ServicesScreenState createState() => new _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  List<String> serveces = [
    "خيوط تصارة وبناء",
    "جلسه كولاجين",
    "جلسة peel2glow تقشير ونضارة فورية",
    "جلسة هايلايت للبشرة أو للشعر",
    "ازالة الشامة",
    "ازالة الزائدة اللحمية",
    "التقشير ماسی",
    "جلسه توکس بیل",
    "فيلر كيميائي",
    "تقشير بلفواكه",
    "بلازما صافية",
    "میزو نضارة",
    "میزو تفتيح",
    "میزو شعر",
    "هایدروفيشل",
    "بیبی گلو",
    "توريد شفة بالميزو",
    "توريد شقة بالديرمای",
    "توريد الشفة بالليزر",
    "ديرماين مع بلارما",
    "میزو هالات سوداء",
    "جلسة تبييض المناطق الحساسة فورية",
    "فيلر المنطقة الحساسة (5 سیسی)",
    "ميزو توريد المنطقة الحساسة",
    "جلسة TCA تبيض المناطق الحساسة",
    "جلسة فراکشنال co2 لیزر",
    "تصفية وعلاج جميع مشاكل البشرة بجلسة او جلستين فقط مع الالتزام بالتعليمات",
    "ليزر ازالة الرؤوس السوداء من الانف",
    "ليزر ازالة الشعيرات الدموية الناعمة",
    "ليزر نضارة البشرة",
    "جلسه( دروكسي ) لازالة الحبوب واثار الحبوب العميقة",
    "بوتكس رفع حاجب او تعرق او ازالة تجاعيد او شد الوجه",
    "فيتان الكوري",
    "بايوريجن الايطالي",
    "تبوسبال السويسري ( علاج هالات قوية و تقعر )",
    "فيلر سوفيديرم الكوري",
    "فيلر ديرمافل الفرنسي",
    "فيلر كاديلا الايطالي",
    "فيلر ديكوريا السويدي",
    "فيلر تیوسیال السويسري"
  ];

  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
      print(platformVersion);
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: new IconThemeData(color: Color(0xffA62B84)),
        centerTitle: true,
        title: Directionality(
          child: Text(
            "الخدمات",
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return rowBodyServeces(serveces[index], widget.day);
          },
          itemCount: serveces.length,
        ),
      ),
    );
  }
}

class rowBodyServeces extends StatelessWidget {
  String title;
  String day;
  rowBodyServeces(this.title, this.day);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xffF292D7)),
      child: InkWell(
        onTap: () {
          if (day != null) {
            try {
              showAlert(context, title, day);
            } catch (_) {
              print("show exeption");
            }
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return BookingScreen();
            }));
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Center(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
