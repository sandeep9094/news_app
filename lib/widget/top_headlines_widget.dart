import 'package:flutter/material.dart';
import 'package:news_app/article/article_screen.dart';
import 'package:news_app/common/context_extensions.dart';

import '../core/model/top_headline.dart';

class TopHeadlinesListWidget extends StatelessWidget {
  final List<TopHeadlineArticles> articles;

  TopHeadlinesListWidget({required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Column(
          children: [
            InkWell(
              onTap: (){
                  context.navigateToScreen(ArticleScreen(article: article));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
                      child: Image.network(
                        article.urlToImage,
                        width: 100,
                        height: 140,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 100,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12), // Match the radius for fallback
                          ),
                          child: const Icon(Icons.image, size: 50, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            article.title,
                            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          const SizedBox(height: 16,),
                          Text(
                            article.description ?? "N/A",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider()
          ],
        );
      },
    );
  }


}
