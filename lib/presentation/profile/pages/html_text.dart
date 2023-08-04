import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/ui_constant.dart';
import '../../widgets/widgets.dart';

class HtmlTextScreen extends HookConsumerWidget {
  static String route = '/html_text';
  const HtmlTextScreen({
    super.key,
    required this.title,
    required this.details,
  });

  final String title;
  final String details;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: KAppBar(titleText: title),
      body: SingleChildScrollView(
        padding: padding20,
        child: Container(),
        // child: Html(
        //   data: details,
        //   onLinkTap: (url, _, __, ___) async {
        //     if (url != null) {
        //       // context.push("${WebViewScreen.route}?url=$url");
        //     }
        //   },
        // ),
      ),
    );
  }
}
