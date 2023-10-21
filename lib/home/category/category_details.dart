import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_c9_online/api/api_manger.dart';
import 'package:flutter_news_app_c9_online/home/category/cubit/category_detials_view_model.dart';
import 'package:flutter_news_app_c9_online/home/category/cubit/states.dart';
import 'package:flutter_news_app_c9_online/home/model/SourcesResponse.dart';
import 'package:flutter_news_app_c9_online/home/model/categoryDM.dart';
import 'package:flutter_news_app_c9_online/home/tabs/tab_container.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'home.category-details';
  CategoryDM category;
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
    return BlocBuilder<CategoryDetailsViewModel, SourceStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (state is SourceErrorState) {
            return Column(
              children: [
                Text(state.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSourceByCategoryId(widget.category.id);
                    },
                    child: Text("Try Again"))
              ],
            );
          } else if (state is SourceSucuessState) {
            return TabContainer(sourcesList: state.sourceList);
          }
          return Container(); // un reachable
        });

    // FutureBuilder<SourceResponse>(
    //     future: ApiManager.getSources(widget.category.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Column(
    //           children: [
    //             Text("Something went wrong"),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getSources(widget.category.id);
    //                   setState(() {});
    //                 },
    //                 child: Text("Try Again"))
    //           ],
    //         );
    //       }
    //
    //       /// server (success , error)
    //       if (snapshot.data?.status != 'ok') {
    //         /// error , message , code
    //         return Column(
    //           children: [
    //             Text(snapshot.data?.message ?? ''),
    //             ElevatedButton(onPressed: () {}, child: Text("Try Again"))
    //           ],
    //         );
    //       }
    //       var sourcesList = snapshot.data?.sources ?? [];
    //       return TabContainer(sourcesList: sourcesList);
    //     });
  }
}
