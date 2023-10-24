import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_c9_online/home/news/cubit/news_container_view_model.dart';
import 'package:flutter_news_app_c9_online/home/news/cubit/states.dart';
import 'package:flutter_news_app_c9_online/home/news/news_item.dart';
import 'package:flutter_news_app_c9_online/model/SourceResponse.dart';
import 'package:flutter_news_app_c9_online/repository/news/repository/news_repository_impl.dart';

class NewsContainer extends StatefulWidget {
  Source source;
  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsContainerViewModel viewModel = NewsContainerViewModel(injectNewsRepository());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id??"");
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NewsContainerViewModel, NewsStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (state is NewsErrorState) {
          return Column(
            children: [
              Text(state.errorMessage!),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBySourceId(widget.source.id ?? "");
                  },
                  child: Text('Try agin'))
            ],
          );
        } else if (state is NewsSuccuessState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: state.newsList[index]);
            },
            itemCount: state.newsList.length,
          );
        }
        return Container();
      });
    //   BlocConsumer<NewsContainerViewModel,NewsStates>(
    //   bloc: viewModel,
    //     builder: (context, state) {
    //       if (state is NewsLoadingState) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         );
    //       } else if (state is NewsErrorState) {
    //         return Column(
    //           children: [
    //             Text(state.errorMessage!),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   viewModel.getNewsBySourceId(widget.source.id ?? "");
    //                 },
    //                 child: Text('Try agin'))
    //           ],
    //         );
    //       } else if (state is NewsSuccuessState) {
    //         return ListView.builder(
    //           itemBuilder: (context, index) {
    //             return NewsItem(news: state.newsList[index]);
    //           },
    //           itemCount: state.newsList.length,
    //         );
    //       }
    //       return Container();
    //     },
    //     listener: (context,state){
    //       if(state is MessageState){
    //         //todo: alert dialog - snack bar
    //       }
    //     },
    //   listenWhen: (previous, newState) {
    //     if(newState is MessageState){
    //       return true ;
    //     }
    //     return false ;
    //   },
    //   buildWhen:(previous, newState) {
    //     if(newState is MessageState){
    //       return false ;
    //     }
    //     return true ;
    //   } ,
    // );

    //   FutureBuilder<NewsResponse>(
    //   future: ApiManger.getNewsBySourceId(widget.source.id??''),
    //     builder: (context,snapshot){
    //     if(snapshot.connectionState == ConnectionState.waiting){
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Theme.of(context).primaryColor,
    //         ),
    //       );
    //     }else if(snapshot.hasError){
    //       return Column(
    //         children: [
    //           Text('Something went wrong'),
    //           ElevatedButton(onPressed: (){
    //             ApiManger.getNewsBySourceId(widget.source.id??'');
    //             setState(() {
    //
    //             });
    //           }, child: Text('Try agin'))
    //         ],
    //       );
    //     }
    //     if(snapshot.data?.status != 'ok'){
    //       return Text(snapshot.data?.message??'Something went wrong');
    //     }
    //     var newsList = snapshot.data?.articles ?? [];
    //     return ListView.builder(itemBuilder: (context, index) {
    //       return NewsItem(news: newsList[index]);
    //     },
    //       itemCount: newsList.length,
    //     );
    //     }
    // );
  }
}
