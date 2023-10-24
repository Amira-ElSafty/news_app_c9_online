import 'package:flutter/material.dart';
import 'package:flutter_news_app_c9_online/home/category/category_details.dart';
import 'package:flutter_news_app_c9_online/home/category/category_fragments.dart';
import 'package:flutter_news_app_c9_online/home/settings/settings_tab.dart';
import 'package:flutter_news_app_c9_online/home/tabs/home_drawer.dart';
import 'package:flutter_news_app_c9_online/model/category.dart';
import 'package:flutter_news_app_c9_online/my_theme.dart';

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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              selectedDrawerItem == HomeDrawer.settings ?
                  'Settings':
              selectedCategory == null ?
              'News App'
              : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(onDrawerItemClick: onDrawerItemClick ),
          ),
          body: selectedDrawerItem == HomeDrawer.settings ?
              SettingsTab()
              :
          selectedCategory == null ?
          CategoryFragment(onCategoryClick: onCategoryClick):
          CategoryDetails(category: selectedCategory!),
        )
      ],
    );
  }

  Category? selectedCategory ;

  void onCategoryClick(Category newSelectedCategory){
    selectedCategory = newSelectedCategory ;
    setState(() {

    });
  }

  int selectedDrawerItem = HomeDrawer.categories ;
  void onDrawerItemClick(int newSelectedDrawerItem){
    selectedDrawerItem = newSelectedDrawerItem ;
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });
  }
}
