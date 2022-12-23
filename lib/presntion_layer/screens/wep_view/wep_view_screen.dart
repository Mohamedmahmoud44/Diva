import 'package:flutter/material.dart';

import 'component/wep_view_content.dart';

class WepViewScreen extends StatelessWidget {
  const WepViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF4267B2),
                ),
              ),
              child: WepViewContent(url: 'https://m.facebook.com/Divaniicce'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Color(0xFF5B51D8)),
                    bottom: BorderSide(color: Color(0xFFFFDC80)),
                    right: BorderSide(color: Color(0xFFE1306C)),
                    left: BorderSide(color: Color(0xFFC13584))),
              ),
              child: WepViewContent(
                  url: 'https://www.instagram.com/divastore.55/'),
            ),
          ],
        ),
      ),
    );
  }
}
