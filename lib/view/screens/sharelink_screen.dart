import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class ShareLink extends StatelessWidget {
  ShareLink(this.url);
  static const String id = "sharelink_screen";

  String? url;

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color.fromRGBO(77, 67, 187, 1),
            Color.fromRGBO(255, 255, 255, 1),
          ])),
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: IconButton(
                iconSize: 40,
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                 Get.back();
                },
              )),
          Padding(
            padding: EdgeInsets.all(8),
            child: Image.asset('assets/images/icon-small.png'),
          ),
          Text('Share',
              style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Padding(
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset('assets/svg/share-icon.svg')),
        ]),
        Padding(
            padding: EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse("https://wa.me/?text=$url"));
                    },
                    child: Column(children: [
                    SvgPicture.asset('assets/svg/whatsapp-icon.svg'),
                    Text('whatsapp')
                  ])),
                  Column(children: [
                    SvgPicture.asset('assets/svg/instagram-icon.svg'),
                    Text('instagram')
                  ]),
                  Column(children: [
                    SvgPicture.asset('assets/svg/gmail-icon.svg'),
                    Text('gmail')
                  ])
                ])),
        Padding(
            padding: EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    SvgPicture.asset('assets/svg/facebook-icon.svg'),
                    Text('facebook')
                  ]),
                  Column(children: [
                    SvgPicture.asset('assets/svg/google-drive-icon.svg'),
                    Text('drive')
                  ]),
                    GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse("https://t.me/share/url?url=$url&text=$url"));
                    },
                    child: Column(children: [
                    SvgPicture.asset('assets/svg/telegram-icon.svg'),
                    Text('telegram')
                  ]))
                ])),
      ]),
    ));
  }
}
