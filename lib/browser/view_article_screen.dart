import 'package:flutter/material.dart';
import 'package:news_app/common/context_extensions.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

part 'view_article_controller.dart';

class ViewArticleScreen extends StatefulWidget {
  final String url;

  const ViewArticleScreen({Key? key, required this.url}) : super(key: key);

  @override
  createState() => _ViewArticleScreen();
}

class _ViewArticleScreen extends ViewArticleController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('View Article'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              context.popScreen();
            },
          )),
      body: isLoading == true ? const Center(child: CircularProgressIndicator()) : WebViewWidget(controller: _controller),
    );
  }
}
