import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/components/news_tile.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/josn_to_model.dart';
import 'package:news_app/pages/webview_news.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  Future<List<Article>> _getNews() async {
    // final String url =
    //     "${Constants.baseUrl}${Constants.topHeadlines}?apiKey=${Constants.apiKey}${Constants.country}";
    const String url =
        'https://newsapi.org/v2/top-headlines?apiKey=20cae1d91774439aa1cebb3900e77f5f&country=in';
    final parseUrl = Uri.parse(url);
    final response = await http.get(parseUrl);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      Welcome welcome = Welcome.fromJson(data);
      return welcome.articles ?? [];
    } else {
      throw Exception('Failed to load articles.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _getNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print('Error fetching articles: ${snapshot.error}');
              return const Center(child: Text("Oops, We have an error"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No articles available'));
            } else {
              final articles = snapshot.data!;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return NewsTile(
                    leading: Text((index + 1).toString()),
                    title: Text(
                      article.title ?? 'No title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(article.author ?? 'Unknown author'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewPage(
                              url: article.url ?? "Nothing available"),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
