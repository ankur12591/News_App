import 'package:news_app/category.dart';

List<Category> getCategoryData() {
  List<Category> categories = List<Category> ();
  
  //1

  Category category = Category();
  category.imgUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.label = "General";
  categories.add(category);

  //2

  category = Category();
  category.imgUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.label = "Entertainment";
  categories.add(category);

  //3

  category = Category();
  category.imgUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.label = "Sports";
  categories.add(category);

  //4

  category = Category();
  category.imgUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.label = "Health";
  categories.add(category);

  //5

  category = Category();
  category.imgUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.label = "Technology";
  categories.add(category);

  //6

  category = Category();
  category.imgUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  category.label = "Business";
  categories.add(category);

  return categories;
}