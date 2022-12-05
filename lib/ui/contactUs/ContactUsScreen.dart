import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uber_eats_driver_app/constants.dart';
import 'package:uber_eats_driver_app/services/FirebaseHelper.dart';
import 'package:uber_eats_driver_app/services/helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  String address = "", phone = "", email = "";

  @override
  void initState() {
    super.initState();
    FireStoreUtils().getContactUs().then((value) {
      setState(() {
        address = value['Address'];
        phone = value['Phone'];
        email = value['Email'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode(context) ? Color(DARK_VIEWBG_COLOR) : Colors.white,
      floatingActionButton: FloatingActionButton(
        heroTag: 'Contact Us'.tr(),
        onPressed: () {
          String url = 'tel:$phone';
          launch(url);
        },
        backgroundColor: Color(COLOR_ACCENT),
        child: Icon(
          CupertinoIcons.phone_solid,
          color: isDarkMode(context) ? Colors.black : Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(
            color: isDarkMode(context) ? Colors.white : Colors.black,
          ),
        ).tr(),
      ),
      body: Column(children: <Widget>[
        Material(
            elevation: 2,
            color: isDarkMode(context) ? Color(DARK_CARD_BG_COLOR) : Colors.white,
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16, top: 16),
                child: Text(
                  'Our Address',
                  style: TextStyle(color: isDarkMode(context) ? Colors.white : Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                ).tr(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16, top: 16, bottom: 16),
                child: Text(address.replaceAll(r'\n', '\n')),
              ),
              ListTile(
                title: Text(
                  'Email Us',
                  style: TextStyle(color: isDarkMode(context) ? Colors.white : Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                ).tr(),
                subtitle: Text('$email'),
                trailing: Icon(
                  CupertinoIcons.chevron_forward,
                  color: isDarkMode(context) ? Colors.white54 : Colors.black54,
                ),
              )
            ]))
      ]),
    );
  }
}
