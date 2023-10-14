import 'package:flutter/material.dart';
import 'package:flutter_news_app_c9_online/api/api_manger.dart';
import 'package:flutter_news_app_c9_online/home/news/news_container_view_model.dart';
import 'package:flutter_news_app_c9_online/model/NewsResponse.dart';
import 'package:flutter_news_app_c9_online/model/SourcesResponse.dart';

import 'package:flutter_news_app_c9_online/home/news/news_item.dart';
import 'package:provider/provider.dart';

class NewsContainer extends StatefulWidget {
  Source source;

  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsContainerViewModel viewModel = NewsContainerViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id??"");
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsContainerViewModel>(
        child: Text('Header'),
          builder: (context, viewModel, child) {
        if (viewModel.errorMessage != null) {
          return Column(
            children: [
              child!,
              Text(viewModel.errorMessage!),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBySourceId(widget.source.id ?? "");
                  },
                  child: Text('Try Again'))
            ],
          );
        } else if (viewModel.newsList == null) {
          return Column(
            children: [
              child!,
              Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: viewModel.newsList![index]);
            },
            itemCount: viewModel.newsList!.length,
          );
        }
      }),
    );

    // FutureBuilder<NewsResponse>(
    //   future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Theme.of(context).primaryColor,
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text('SomeThing went wrong'),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //                 setState(() {});
    //               },
    //               child: Text('Try Again'))
    //         ],
    //       );
    //     }
    //     if (snapshot.data?.status != 'ok') {
    //       return Text(snapshot.data?.message ?? 'SomeThing went wrong');
    //     }
    //     var newsList = snapshot.data?.articles ?? [];
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         return NewsItem(news: newsList[index]);
    //       },
    //       itemCount: newsList.length,
    //     );
    //   });
  }
}
