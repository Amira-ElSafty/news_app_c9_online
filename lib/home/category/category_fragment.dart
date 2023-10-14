import 'package:flutter/material.dart';
import 'package:flutter_news_app_c9_online/home/category/category_item.dart';
import 'package:flutter_news_app_c9_online/model/categoryDM.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryDM.getCategories(); /// List<CategoryDM>
  Function onCategoryClick;
  CategoryFragment({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category \nof interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 15,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2 ,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15
                ),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      onCategoryClick(categoriesList[index]);
                    },
                      child: CategoryItem(category: categoriesList[index], index: index));
                },
            itemCount:categoriesList.length ,),
          )
        ],
      ),
    );
  }
}
