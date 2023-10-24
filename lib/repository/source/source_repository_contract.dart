import 'package:flutter_news_app_c9_online/model/SourceResponse.dart';

abstract class SourceRepositoryContract{
  Future<SourceResponse?> getSourceByCategoryId(String categoryId);
}
abstract class SourceRemoteDataSource{
  Future<SourceResponse?> getSourcesByCategoryId(String categoryId);
}
abstract class SourceOfflineDataSource{}
abstract class SourceCachingDataSource{}