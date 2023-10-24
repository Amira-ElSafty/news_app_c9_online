import 'package:flutter_news_app_c9_online/model/NewsResponse.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}

abstract class NewsRemoteDataSource{
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}
abstract class NewsLocalDataSource{

}