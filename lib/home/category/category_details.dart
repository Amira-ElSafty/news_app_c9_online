import 'package:flutter/material.dart';
import 'package:flutter_news_app_c9_online/api/api_manger.dart';
import 'package:flutter_news_app_c9_online/home/category/category_details_view_model.dart';
import 'package:flutter_news_app_c9_online/home/tabs/tab_container.dart';
import 'package:flutter_news_app_c9_online/model/SourcesResponse.dart';
import 'package:flutter_news_app_c9_online/model/categoryDM.dart';
import 'package:provider/provider.dart';


class CategoryDetails extends StatefulWidget {
  static const String routeName = 'home.category-details';
  CategoryDM category ;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourceByCategoryId(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        child: Text('Header Top'),
          builder: (context,viewModel,child){
            if(viewModel.errorMessage != null){
              return Column(
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(onPressed: (){
                    viewModel.getSourceByCategoryId(widget.category.id);
                  }, child: Text('Try Again'))
                ],
              );
            }
            else if(viewModel.sourcesList == null){
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }else{
              return Column(
                children: [
                  child!,
                  Expanded(child: TabContainer(sourcesList:viewModel.sourcesList! )),
                ],
              );
            }
          }
      ),
    );



      FutureBuilder<SourceResponse>(
          future: ApiManager.getSources(widget.category.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text("Something went wrong"),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSources(widget.category.id);
                        setState(() {});
                      },
                      child: Text("Try Again"))
                ],
              );
            }

            /// server (success , error)
            if (snapshot.data?.status != 'ok') {
              /// error , message , code
              return Column(
                children: [
                  Text(snapshot.data?.message ?? ''),
                  ElevatedButton(onPressed: () {}, child: Text("Try Again"))
                ],
              );
            }
            var sourcesList = snapshot.data?.sources ?? [];
            return TabContainer(sourcesList: sourcesList);
          });

  }
}
