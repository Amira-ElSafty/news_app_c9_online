import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app_c9_online/home/model/NewsResponse.dart';
import 'package:flutter_news_app_c9_online/my_theme.dart';


class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  news.urlToImage ?? '',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.fill,
                ),
            ),
      ),

                // CachedNetworkImage(
                //     imageUrl: news.urlToImage??'',
                //   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                //   errorWidget: (context, url, error) => Icon(Icons.error),
                // ),


          SizedBox(
            height: 10,
          ),
          Text(
            news.author ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 14, color: MyTheme.greyColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            news.title ?? '',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            news.publishedAt ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 14, color: MyTheme.greyColor),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}
