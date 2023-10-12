import 'package:flutter/material.dart';
import 'package:flutter_news_app_c9_online/my_theme.dart';

class CategoryDM{
  String id ;
  String title ;
  String image ;
  Color color ;

  CategoryDM({required this.id,required this.title,required this.color,
  required this.image});

  static List<CategoryDM> getCategories(){
    return [
      CategoryDM(id: 'sports', title: 'Sports',
          color: MyTheme.redColor, image: 'assets/images/sports.png'),
      CategoryDM(id: 'general', title: 'General',
          color: MyTheme.darkBlueColor, image: 'assets/images/general.png'),
      CategoryDM(id: 'health', title: 'Health',
          color: MyTheme.pinkColor, image: 'assets/images/health.png'),
      CategoryDM(id: 'business', title: 'Business',
          color: MyTheme.brownColor, image: 'assets/images/bussines.png'),
      CategoryDM(id: 'entertainment', title: 'Entertainment',
          color: MyTheme.blueColor, image: 'assets/images/entertainment.png'),
      CategoryDM(id: 'science', title: 'Science',
          color: MyTheme.yellowColor, image: 'assets/images/science.png'),
      CategoryDM(id: 'technology', title: 'Technology',
          color: MyTheme.darkBlueColor, image: 'assets/images/technology.png'),
    ];
  }


}