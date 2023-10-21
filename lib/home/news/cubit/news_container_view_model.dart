import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_c9_online/api/api_manger.dart';
import 'package:flutter_news_app_c9_online/home/news/cubit/states.dart';

class NewsContainerViewModel extends Cubit<NewsStates>{
  NewsContainerViewModel():super(NewsLoadingState());

  void getNewsBySourceId(String sourceId)async{
    try{
      emit(NewsLoadingState());
      emit(MessageState(message: 'loading...'));
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if(response.status == 'error'){
        emit(NewsErrorState(errorMessage: response.message));
      }else{ /// response.status == 'ok
        emit(NewsSuccuessState(newsList: response.articles!));
      }
    }catch(e){
      emit(NewsErrorState(errorMessage: 'Error Loading News List'));
    }
  }
}