
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_c9_online/api/api_manger.dart';
import 'package:flutter_news_app_c9_online/home/news/cubit/states.dart';
import 'package:flutter_news_app_c9_online/repository/news/dataSource/news_remote_data_source_impl.dart';
import 'package:flutter_news_app_c9_online/repository/news/news_repository_contract.dart';
import 'package:flutter_news_app_c9_online/repository/news/repository/news_repository_impl.dart';

class NewsContainerViewModel extends Cubit<NewsStates>{
   NewsRepositoryContract repositoryContract ;
  NewsContainerViewModel(this.repositoryContract):super(NewsLoadingState());

  void getNewsBySourceId(String sourceId)async{
    try{
      emit(NewsLoadingState());
      emit(MessageState(message: 'loading...'));
      var response = await repositoryContract.getNewsBySourceId(sourceId);
      if(response?.status == 'error'){
        emit(NewsErrorState(errorMessage: response!.message));
      }else{
        emit(NewsSuccuessState(newsList: response!.articles!));
      }
    }catch(e){
      emit(NewsErrorState(errorMessage: 'Error loading News List'));
    }
  }
}