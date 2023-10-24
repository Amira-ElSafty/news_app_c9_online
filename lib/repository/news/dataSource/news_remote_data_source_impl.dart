import 'package:flutter_news_app_c9_online/api/api_manger.dart';
import 'package:flutter_news_app_c9_online/model/NewsResponse.dart';
import 'package:flutter_news_app_c9_online/repository/news/news_repository_contract.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManger apiManger ;
  NewsRemoteDataSourceImpl(this.apiManger);
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async{
   var response = await apiManger.getNewsBySourceId(sourceId);
   return response ;
  }

}
NewsRemoteDataSource injectNewsRemoteDataSource(){
  return NewsRemoteDataSourceImpl(ApiManger.getInstance());
}

