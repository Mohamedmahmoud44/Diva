import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildIcon extends StatelessWidget {
  BuildIcon({
    Key? key,
    required this.widget,
    this.url = '',
  }) : super(key: key);
  final Widget widget;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          if (!await launchUrl(Uri.parse(url),
              mode: LaunchMode.externalApplication)) {
            throw 'Could not launch ${url}';
          }
        },
        child: widget);
  }
}
