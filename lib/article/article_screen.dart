import 'package:flutter/material.dart';
import 'package:news_app/common/context_extensions.dart';
import 'package:news_app/utils/logs.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/model/top_headline.dart';

part 'article_controller.dart';

class ArticleScreen extends StatefulWidget {
  final TopHeadlineArticles article;

  const ArticleScreen({required this.article, super.key});

  @override
  createState() => _ArticleScreen();
}

class _ArticleScreen extends ArticleController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                widget.article.urlToImage.isNotEmpty
                    ? widget.article.urlToImage
                    : 'https://via.placeholder.com/600x400', // Fallback if no image
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image, size: 50, color: Colors.grey),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'News',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.article.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.article.author,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        // backgroundImage: NetworkImage(
                        //   'https://via.placeholder.com',
                        // ),
                        radius: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.article.source.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            widget.article.content.isNotEmpty ? widget.article.content : "No content available.",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Open Article Button
                          ElevatedButton.icon(
                            onPressed: () => openArticleLink(widget.article.url),
                            icon: const Icon(Icons.open_in_browser),
                            label: const Text("Open Article"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Open URL in an external browser
  Future<void> openArticleLink(String url) async {
    logger.d("Url: $url");
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      context.showErrorFlushBar("Could not open the URL!");
    }
  }

}
