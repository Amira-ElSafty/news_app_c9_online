import 'package:flutter_news_app_c9_online/model/NewsResponse.dart';
import 'package:flutter_news_app_c9_online/repository/news/dataSource/news_remote_data_source_impl.dart';
import 'package:flutter_news_app_c9_online/repository/news/news_repository_contract.dart';

class NewsRepositoryImpl implements NewsRepositoryContract{
  NewsRemoteDataSource remoteDataSource ;
  NewsRepositoryImpl(this.remoteDataSource);
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }

}
NewsRepositoryContract injectNewsRepository(){
  return NewsRepositoryImpl(injectNewsRemoteDataSource());
}