import 'package:flutter_news_app_c9_online/api/api_manger.dart';
import 'package:flutter_news_app_c9_online/model/SourceResponse.dart';
import 'package:flutter_news_app_c9_online/repository/source/source_repository_contract.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManger apiManger ;
  SourceRemoteDataSourceImpl(this.apiManger);
  @override
  Future<SourceResponse?> getSourcesByCategoryId(String categoryId) async{
    var response = await apiManger.getSource(categoryId);
    return response ;
  }
}
SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl(ApiManger.getInstance());
}
