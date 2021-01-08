import 'package:flutter/material.dart';
import 'package:news_app/news.dart';
import 'package:news_app/article.dart';
import 'package:news_app/news_app.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  CategoryScreen(this.category);


  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List<Article> articles = List<Article>();

  News news = News();

  getNews() async {
    await news.getNewsByCategory("in", widget.category.toLowerCase());
    articles = news.articles;
    setState(() {});
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text("${widget.category} News"),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${widget.category}",
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.w600),
            ),
            Opacity(opacity: 0,
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save),
              ),
            ),
          ],
        ),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 3,vertical: 14),
        child: ListView.builder(
            itemCount: articles.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return NewsTile(
                  title: articles[index].title,
                  description: articles[index].description,
                  imgUrl: articles[index].urlToImage,
                  url: articles[index].url);
            }),
      ),
    );
  }
}
