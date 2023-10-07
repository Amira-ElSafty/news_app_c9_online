import 'package:flutter/material.dart';
import 'package:flutter_news_app_c9_online/api/api_manger.dart';
import 'package:flutter_news_app_c9_online/home/model/SourcesResponse.dart';
import 'package:flutter_news_app_c9_online/home/tabs/tab_container.dart';


class CategoryDetails extends StatefulWidget {
  static const String routeName = 'home.category-details';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: FutureBuilder<SourceResponse>(
          future: ApiManager.getSources(),
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
                        ApiManager.getSources();
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
          }),
    );
  }
}
