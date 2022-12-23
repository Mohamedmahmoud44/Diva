import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WepViewContent extends StatefulWidget {
  WepViewContent({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<WepViewContent> createState() => _WepViewContentState();
}

class _WepViewContentState extends State<WepViewContent> {
  late WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..clearLocalStorage()
    ..clearCache()
    ..reload()
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
// Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) async {
          // await Future.delayed(const Duration(milliseconds: 500), () async {
          //   await controller.runJavaScript(
          //       '''document.querySelector('[data-comp-id="22222"]').remove()''');
          // });
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(widget.url));
  @override
  void initState() {
    controller.clearCache();
    controller.clearLocalStorage();
    controller.reload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: WebViewWidget(gestureRecognizers: {
        Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer())
      }, controller: controller),
    );
  }
}
