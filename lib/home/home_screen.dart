import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/article/article_screen.dart';
import 'package:news_app/common/context_extensions.dart';
import 'package:news_app/core/network/api_status.dart';
import 'package:news_app/home/home_viewmodel.dart';
import 'package:news_app/utils/logs.dart';
import 'package:news_app/widget/top_headlines_widget.dart';

import '../core/model/top_headline.dart';

part 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  createState() => _HomeScreen();
}

class _HomeScreen extends HomeController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Top Headlines'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              SystemNavigator.pop();
            },
          )),
      body:
          isLoading ? const Center(child: CircularProgressIndicator()) : TopHeadlinesListWidget(articles: topHeadlines),
    );
  }
}
