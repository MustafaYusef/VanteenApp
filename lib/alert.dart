import 'package:flutter/material.dart';

import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

void whatsAppOpen(
    String name, String phone, String services, String day) async {
  await FlutterOpenWhatsapp.sendSingleMessage(
      "+964" + "7722609065", """الأسم:$name
 الرقم:$phone
 الخدمة المطلوبة:$services
اليوم:$day
 """);
}

showAlert(BuildContext context, String title, String day) {
  
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromBottom,
    isCloseButton: true,
    isOverlayTapDismiss: true,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(color: Color(0xffFFB300), fontSize: 20),
  );
  Alert(
      style: alertStyle,
      context: context,
      title: "طلب الخدمة",
      content: Column(
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'الأسم',
              ),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              keyboardType: TextInputType.phone,
              maxLength: 11,
              controller: phoneController,
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                labelText: 'الرقم',
              ),
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          radius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor,
          onPressed: () async {
            if (nameController.text.isNotEmpty &&
                phoneController.text.isNotEmpty) {
              if (phoneController.text.length < 11) {
                Toast.show("أدخل رقم صحيح", context,
                    duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
              } else {
                Navigator.pop(context);
                try {
                  whatsAppOpen(
                      nameController.text, phoneController.text, title, day);
                } catch (_) {
                  Toast.show("something wrong", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                }
              }
            } else {
              Toast.show("يرجى أكمال جميع الحقول", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
            }
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              "أرسال",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )
      ]).show();
}
