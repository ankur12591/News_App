import 'dart:convert';
import 'package:news_app/article.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/keys.dart';
  class News {
    List<Article> articles = List<Article> ();


    Future<void> getNews(String country) async {
      String url = "http://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=$newsApiKey";
      // String url = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-11-17&sortBy=publishedAt&apiKey=b8e8217413464cfe8497c1bc822391a1";

      var response = await http.get(url);

      var jsonData  = jsonDecode(response.body);

      if (jsonData["status"] == "ok") {
        jsonData["articles"].forEach((element) {
          if (element["description"] != null && element["urlToImage"] != null) {
            Article article = Article();
            article.title = element["title"];
            article.description = element["description"];
            article.url = element["url"];
            article.urlToImage = element["urlToImage"];
            articles.add(article);
          }
        });
      }
    }


    Future<void> getNewsByCategory(String country, String category) async {
      String url =
          "http://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=$newsApiKey";

      var response = await http.get(url);

      var jsonData = jsonDecode(response.body);

      if (jsonData["status"] == "ok") {
        jsonData["articles"].forEach((element) {
          if (element["description"] != null && element["urlToImage"] != null) {
            Article article = Article();
            article.title = element["title"];
            article.description = element["description"];
            article.url = element["url"];
            article.urlToImage = element["urlToImage"];
            articles.add(article);
          }
        });
      }
    }
  }


