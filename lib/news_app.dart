import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news_app/Helper/App_Bar.dart';
import 'package:news_app/Views/article_view.dart';
import 'package:news_app/Views/category.dart';
import 'package:news_app/category.dart';
import 'package:news_app/data.dart';
import 'package:news_app/news.dart';
import 'package:news_app/article.dart';



class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  List<Category> categories = List<Category>();
  List<Article> articles = List<Article> ();

  News news = News();

  getAndSetNews() async {
    await news.getNews("in");
    articles = news.articles;
    setState(() {
    });
  }

  @override
  void initState() {
    categories = getCategoryData();
    getAndSetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),



      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              Container(
                height: 90,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                    return CategoryTile(
                        categories[index].imgUrl,
                        categories[index].label,);
                  }
                ),
              ),
              SizedBox(height: 10,),

              ListView.builder(
                itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                  return NewsTile(
                    title: articles[index].title,
                    description: articles[index].description,
                    url: articles[index].url,
                    imgUrl: articles[index].urlToImage,);
                  }
              )
            ],
          ),
        ),
      )
    );
  }
}


class CategoryTile extends StatelessWidget {
  final String imgUrl;
  final String label;
  CategoryTile(this.imgUrl,this.label);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => CategoryScreen(label)
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3,vertical: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(imgUrl,
              height: 60,
              width: 120,
              fit: BoxFit.fill,),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(5),),
              alignment: Alignment.center,
              height: 60,
              width: 120,
              child: Text(label,
                style: TextStyle(
                fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class NewsTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String description;
  final String url;
  NewsTile({this.imgUrl,this.title,this.description,this.url, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => ArticleView(
              postUrl: url),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                  imgUrl,
                height: 180,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12,),
            Text(title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            ),
            SizedBox(height: 8,),
            Text(description),
          ],
        ),
      ),
    );
  }
}
