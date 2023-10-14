import 'package:flutter/material.dart';
import 'package:flutter_news_app_c9_online/home/category/category_details.dart';
import 'package:flutter_news_app_c9_online/home/category/category_fragment.dart';
import 'package:flutter_news_app_c9_online/home/home_drawer.dart';
import 'package:flutter_news_app_c9_online/model/categoryDM.dart';
import 'package:flutter_news_app_c9_online/my_theme.dart';
import 'package:flutter_news_app_c9_online/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              'assets/images/main_background.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
          appBar: AppBar(
            title: Text(
              selectedMenuItem == HomeDrawer.settings ? 'Settings':
              selectedCategory == null ?'News App' : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItem: onSideMenuItem),
          ),
          body: selectedMenuItem == HomeDrawer.settings ?
              SettingTab()
              :
          selectedCategory == null
              ? CategoryFragment(onCategoryClick: onCategoryClick)
              : CategoryDetails(category: selectedCategory!),
        ),
      ],
    );
  }

  CategoryDM? selectedCategory;
  void onCategoryClick(CategoryDM newSelectedCategory) {
    //todo: newsSelectedCategory => User
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }

  int selectedMenuItem = HomeDrawer.categories ;
  void onSideMenuItem(int newsSelectedMenuItem){
  //todo: newsSelectedMenuItem => User
    selectedMenuItem = newsSelectedMenuItem ;
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });
  }
}
