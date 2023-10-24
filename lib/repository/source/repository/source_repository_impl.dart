import 'package:flutter_news_app_c9_online/model/SourceResponse.dart';
import 'package:flutter_news_app_c9_online/repository/source/dataSource/source_remote_data_source_impl.dart';
import 'package:flutter_news_app_c9_online/repository/source/source_repository_contract.dart';

class SourceRepositoryImpl implements SourceRepositoryContract{
  SourceRemoteDataSource remoteDataSource ;
  SourceRepositoryImpl(this.remoteDataSource);
  @override
  Future<SourceResponse?> getSourceByCategoryId(String categoryId) {
    return remoteDataSource.getSourcesByCategoryId(categoryId);
  }
}
SourceRepositoryContract injectSourceRepositoryContract(){
  return SourceRepositoryImpl(injectSourceRemoteDataSource());
}