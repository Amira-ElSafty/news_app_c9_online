import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_c9_online/home/category/cubit/category_details_view_model.dart';
import 'package:flutter_news_app_c9_online/home/category/cubit/states.dart';
import 'package:flutter_news_app_c9_online/home/tabs/tab_container.dart';
import 'package:flutter_news_app_c9_online/model/category.dart';
import 'package:flutter_news_app_c9_online/repository/source/repository/source_repository_impl.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'Category-details';
  Category category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel(injectSourceRepositoryContract());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.category.id);
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
                      viewModel.getSourcesByCategoryId(widget.category.id);
                    },
                    child: Text('Try Again'))
              ],
            );
          } else if (state is SourceSuccuessState) {
            return TabContainer(sourceList: state.sourceList);
          }
          return Container();

          /// not reachable
        });
    //   FutureBuilder<SourceResponse>(
    //     future: ApiManger.getSource(widget.category.id),
    //       builder: (context, snapshot) {
    //         if(snapshot.connectionState == ConnectionState.waiting){
    //           return Center(
    //             child: CircularProgressIndicator(
    //               color: Theme.of(context).primaryColor,
    //             ),
    //           );
    //         } else if(snapshot.hasError){
    //           return Column(
    //             children: [
    //               Text('Something went wrong'),
    //               ElevatedButton(onPressed: (){
    //                 ApiManger.getSource(widget.category.id);
    //                 setState(() {
    //
    //                 });
    //               }, child: Text('Try Again'))
    //             ],
    //           );
    //         }
    //         /// response succuess or error
    //         if(snapshot.data?.status != 'ok'){
    //           return Text(snapshot.data?.message??'Something went wrong');
    //         }
    //         var sourcesList = snapshot.data?.sources ?? [];
    //         return TabContainer(sourceList: sourcesList);
    //
    //       }
    //
    // );
  }
}
