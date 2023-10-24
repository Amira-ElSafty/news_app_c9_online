import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_news_app_c9_online/model/NewsResponse.dart';
import 'package:flutter_news_app_c9_online/my_theme.dart';
class NewsItem extends StatelessWidget {
  News news ;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage??"",
              placeholder: (context, url) => Center(child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 10),
          Text(news.author??"",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: MyTheme.greyColor
            ),
          ),
          SizedBox(height: 10),
          Text(news.title??"",
            style: Theme.of(context).textTheme.titleSmall,),
          SizedBox(height: 10),
          Text(news.publishedAt??"",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: MyTheme.greyColor
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
